package com.advancejava;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.advancejava")
public class Assignment5Application {

	public static void main(String[] args) {
		SpringApplication.run(Assignment5Application.class, args);
	}

}
