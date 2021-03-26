package session;

import java.util.ArrayList;

import domain.Product;
import utility.CartItem;

public class CartBean {
	
	private ArrayList<CartItem> cartItems;
	
	public CartBean() {
		cartItems = new ArrayList<CartItem>();
	}

	public ArrayList<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(ArrayList<CartItem> cartItems) {
		this.cartItems = cartItems;
	}
	
	public void addProduct(Product product, int quantity) {
		CartItem ci = new CartItem(product, quantity);
		cartItems.add(ci);
		System.out.println(cartItems.get(0).getSubPrice());
	}
	
	public void removeProduct(String productCode) {
		for(int i = 0; i < cartItems.size(); i++) {
			if(cartItems.get(i).getProduct().getProductcode().equals(productCode)) {
				cartItems.remove(i);
				break;
			}
		}
	}
	
	public double getSubTotal() {
		double total = 0.0;
		for(CartItem ci: this.cartItems) {
			total += ci.getSubPrice();
		}
		return total;
	}
	
	public void resetCart() {
		this.cartItems.clear();
	}
	
	public int getCartCount() {
		return cartItems.size();
	}
	
	
	public String findIndexByProductCode(String productCode) {
		for(int i = 0; i < cartItems.size(); i++) {
			if(cartItems.get(i).getProduct().getProductcode().equals(productCode)) {
				return String.valueOf(i);
			}
		}
		return "Not Found";
	}
	
	public void modifyQuantity(String productCode, int quantityToModify) {
		String index = findIndexByProductCode(productCode);
		
		if(!index.equals("Not Found")) {
			cartItems.get(Integer.valueOf(index)).setQuantity(cartItems.get(Integer.valueOf(index)).getQuantity() + quantityToModify);
		}
	}

}

