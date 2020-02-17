package com.example.java.app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest/greeting")
public class Greeting {

	@GetMapping
	public String hello() {
		return "Nada es imposible para una mente dispuesta.";
	}

}
