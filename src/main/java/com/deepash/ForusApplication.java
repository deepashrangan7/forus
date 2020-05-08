package com.deepash;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.deepash")
public class ForusApplication {

	public static void main(String[] args) {
		SpringApplication.run(ForusApplication.class, args);

		System.out.println("server started at port 0712");
	}

}
