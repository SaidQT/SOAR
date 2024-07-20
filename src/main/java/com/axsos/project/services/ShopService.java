package com.axsos.project.services;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.axsos.project.models.Shop;
import com.axsos.project.repositories.ShopRepository;

@Service
public class ShopService {
	// ******************* Attributes *******************
	@Autowired
	ShopRepository shopRepository;

	// ******************* Functions *******************
	//	 Function to create a new shop
	public Shop createShop(String shopName, String city, String phoneNumber, Integer maxCapacity, Integer currentSize) {
		Shop shop = new Shop();
		shop.setName(shopName);
		shop.setCity(city);
		shop.setPhoneNumber(phoneNumber);
		shop.setMaxCapacity(maxCapacity);
		shop.setCurrentSize(currentSize);
		return shopRepository.save(shop);
	}

	// Function to find shop by its ID
	public Shop findShop(Long id) {
		Optional<Shop> optionalShop = shopRepository.findById(id);
		if (optionalShop.isPresent()) {
			return optionalShop.get();
		} else {
			return null;
		}
	}

	// Function to get all shops from our database
	public List<Shop> findAll(){
		return shopRepository.findAll();
	}

	// Function to update the shop information
	public Shop updateShop(Shop b) {
		return shopRepository.save(b);
	}

	// Function to delete a shop by its ID
	public void deleteShop(Long id) {
		shopRepository.deleteById(id);
	}

	//	Function to get shop count
	public long getTotalShops() {
		return shopRepository.count();
	}

	//	Function to get last 5 shops added to the database
	public List<Shop> getLastFiveShops() {
		return shopRepository.findLastFiveShops(PageRequest.of(0, 5));
	}

	//	 Function to count shops by city
	public Map<String, Long> countShopsByCity() {
		List<Object[]> result = shopRepository.countShopsByCity();
		return result.stream()
				.collect(Collectors.toMap(
						row -> (String) row[0],
						row -> (Long) row[1]
						));
	}
}