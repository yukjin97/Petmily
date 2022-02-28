package com.petmily.service;
import java.util.List;

import com.petmily.dto.Product;



public interface ProductService {
	public List<Product> listProduct(Product product);

	public List<Product> getPorductListByKind(Product product);
}
