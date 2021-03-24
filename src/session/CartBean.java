package session;

import java.util.ArrayList;

import javax.ejb.Stateful;

import domain.Product;
import utility.CartItem;

@Stateful
public class CartBean {
	
	private ArrayList<CartItem> cartItems = new ArrayList<CartItem>();

	public ArrayList<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(ArrayList<CartItem> cartItems) {
		this.cartItems = cartItems;
	}
	
	public void addProduct(Product product, int quantity) {
		CartItem ci = new CartItem(product, quantity);
		cartItems.add(ci);
	}
	
	public void removeProduct(String productName) {
		for(int i = 0; i < cartItems.size(); i++) {
			if(cartItems.get(i).getProduct().getProductname().equals(productName)) {
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
		for(int i = 0; i < cartItems.size(); i++) {
			this.cartItems.remove(i);
		}
	}
	
	public int getCartCount() {
		return cartItems.size();
	}

}
