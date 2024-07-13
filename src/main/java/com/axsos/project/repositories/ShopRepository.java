package com.axsos.project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.project.models.Shop;

@Repository
public interface ShopRepository extends CrudRepository<Shop, Long>{
	 List<Shop> findAll();
}
