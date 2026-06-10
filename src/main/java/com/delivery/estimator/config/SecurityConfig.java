package com.delivery.estimator.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(10);
    }

    @Bean
    public UserDetailsService userDetailsService(PasswordEncoder encoder) {
        var manager = new InMemoryUserDetailsManager();

        manager.createUser(User.withUsername("api-client")
                .password(encoder.encode("load-test"))
                .roles("API")
                .build());

        manager.createUser(User.withUsername("monitor")
                .password(encoder.encode("monitor-pass"))
                .roles("ACTUATOR")
                .build());

        manager.createUser(User.withUsername("admin")
                .password(encoder.encode("admin-pass"))
                .roles("ADMIN", "API", "ACTUATOR")
                .build());

        manager.createUser(User.withUsername("readonly")
                .password(encoder.encode("readonly-pass"))
                .roles("READ")
                .build());

        manager.createUser(User.withUsername("service-account")
                .password(encoder.encode("svc-pass"))
                .roles("API", "READ")
                .build());

        return manager;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(AbstractHttpConfigurer::disable)
            .sessionManagement(session ->
                session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
            // All endpoints public — no credentials needed for load testing.
            // The filter chain still initializes and runs on every request.
            .authorizeHttpRequests(auth -> auth
                .anyRequest().permitAll()
            )
            // Production rules (commented out) — uncomment to enforce per-endpoint access control:
//          .authorizeHttpRequests(auth -> auth
//              .requestMatchers("/swagger-ui.html", "/swagger-ui/**", "/v3/api-docs/**").permitAll()
//              .requestMatchers("/actuator/**").permitAll()
//              .requestMatchers("/h2-console/**").permitAll()
//              .requestMatchers("/delivery-eta/**").hasRole("API")
//              .anyRequest().authenticated()
//          )
//          .httpBasic(basic -> {})
            .headers(headers -> headers.frameOptions(fo -> fo.sameOrigin()));

        return http.build();
    }
}
