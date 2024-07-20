package com.axsos.project.repositories;

import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.project.models.Shop;

@Repository
public interface ShopRepository extends CrudRepository<Shop, Long>{
	@Override
	List<Shop> findAll();

	@Override
	long count();
	@Query("SELECT s FROM Shop s ORDER BY s.createdAt DESC")
	List<Shop> findLastFiveShops(PageRequest pageRequest);

	@Query("SELECT s.city, COUNT(s) FROM Shop s GROUP BY s.city")
	List<Object[]> countShopsByCity();
}
