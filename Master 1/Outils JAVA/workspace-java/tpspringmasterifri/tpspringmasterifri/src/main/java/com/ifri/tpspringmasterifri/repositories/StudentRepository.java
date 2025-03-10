package com.ifri.tpspringmasterifri.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ifri.tpspringmasterifri.models.Student;

public interface StudentRepository extends JpaRepository<Student, Integer> {

}
