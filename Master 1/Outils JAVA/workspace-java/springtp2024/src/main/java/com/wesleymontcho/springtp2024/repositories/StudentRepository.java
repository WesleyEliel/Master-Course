package com.wesleymontcho.springtp2024.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wesleymontcho.springtp2024.models.Student;

public interface StudentRepository extends JpaRepository<Student, Integer> {

}
