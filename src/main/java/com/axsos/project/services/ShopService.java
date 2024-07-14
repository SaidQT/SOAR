package com.axsos.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axsos.project.models.Shop;
import com.axsos.project.repositories.ShopRepository;

@Service
public class ShopService {
	@Autowired
	ShopRepository shopRepository;

	public Shop createShop(Shop b) {
		return shopRepository.save(b);
	}


	public Shop findShop(Long id) {
		Optional<Shop> optionalShop = shopRepository.findById(id);
		if (optionalShop.isPresent()) {
			return optionalShop.get();
		} else {
			return null;
		}
	}
	public List<Shop> findAll(){
		return shopRepository.findAll();
	}
	public Shop updateShop(Shop b) {
		return shopRepository.save(b);
	}
	public void deleteShop(Long id) {
		shopRepository.deleteById(id);
	}
	
	 public long getTotalShops() {
	        return shopRepository.count();
	    }
}


