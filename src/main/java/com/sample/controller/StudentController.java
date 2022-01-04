package com.sample.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.sample.model.Student;

@RestController
public class StudentController {

	@GetMapping("/getAllStudents")
	public List<Student> getStudents() {
		List<Student> list = new ArrayList<>();
		Student s1 = new Student(101, "swamy1", "8121212121", "sivakumar@capgemini.com", "hyderabad");
		Student s2 = new Student(102, "jagadeesh", "9987473632", "jagadeesh@capgemini.com", "Banglore");
		Student s3 = new Student(103, "kishore", "9752727277", "kishore@capgemini.com", "chennai");
		list.add(s1);
		list.add(s2);
		list.add(s3);

		return list;
	}

	@GetMapping("/getStudent/{id}")
	public String getStudentById(@PathVariable int id) {

		String res = id + " is incorrect Student Id";
		return res;
	}

	@GetMapping("/welcome")
	public String welcome() {

		return "Welcome to Student App";
	}

	@GetMapping("/hello/{name}")
	public String hello(@PathVariable String name) {

		return "Hello  " + name;
	}
}
