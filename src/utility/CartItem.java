package utility;

import domain.Product;

public class CartItem {
	
	private Product product;
	private int quantity;
	
	public CartItem(Product product, int quantity) {
		super();
		this.product = product;
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public double getSubPrice() {
		return product.getBuyprice().doubleValue() * (double) this.quantity;
	}

}
