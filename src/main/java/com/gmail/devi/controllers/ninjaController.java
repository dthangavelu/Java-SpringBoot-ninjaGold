package com.gmail.devi.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ninjaController {

	@Autowired
	private HttpSession session;
	
	private List<String> activities = new ArrayList<>();
	private int gold = 0, totalGold = 0;	
	private Random rand = new Random();	
	
	@GetMapping("/")
	public String index() {		
		session.setAttribute("totalGold", totalGold);		
		return "index";
	}
	
	@PostMapping("/process")
	public String process(@RequestBody String body) {
				
		String category = body.substring(0, body.indexOf('='));
		
		switch(category) {
			case "farm":				
				gold = rand.nextInt(11) + 10;	
				totalGold += gold;
				break;
			case "cave":				
				gold = rand.nextInt(6) + 5;		
				totalGold += gold;
				break;
			case "house":
				gold = rand.nextInt(4) + 2;	
				totalGold += gold;
				break;
			case "casino":				 				
				gold = rand.nextInt(101) + (-50);				
				totalGold += gold;
				break;
				
		}
		
		if(gold > 0) {
			activities.add("You entered a " + category + " and earned " + gold + " gold");			
			session.setAttribute("activities", activities);
			
		}else
		{			
			activities.add("You entered a " + category + " and lost " + gold + " gold... Ouch");
			session.setAttribute("activities", activities);
		}
		
		return "redirect:/";
	}

}
