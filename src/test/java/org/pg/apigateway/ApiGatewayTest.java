package org.pg.apigateway;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;

@SpringBootTest(classes = ApiGatewayLauncher.class)
class ApiGatewayTest {

    @Autowired
    private ApplicationContext context;

    @Test
    void shouldStartup() {
        Assertions.assertNotNull(context);
    }
}
