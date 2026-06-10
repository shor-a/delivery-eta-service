package com.delivery.estimator.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI deliveryEtaOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("Delivery ETA Estimation API")
                        .version("1.0.0")
                        .description("""
                                Stateless, CPU-bound microservice that computes an estimated \
                                time of arrival (ETA) for an in-progress delivery.
                                
                                No database. No outbound calls. Tune `eta.waypoint-count` and \
                                `eta.simulation-iterations` in application.properties to scale \
                                computational load.
                                """)
                        .contact(new Contact()
                                .name("Delivery Platform Team")));
    }
}
