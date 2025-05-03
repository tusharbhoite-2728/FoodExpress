package food.app;

public class GetterSetter {
	
	private static int vendor_id;
	private static int user_id;
	private static int order_id;
	private static int delivery_id;
	private static int dishes_id;
	
	public static int getVendor_id() {
		return vendor_id;
	}
	public static void setVendor_id(int vendor_id) {
		GetterSetter.vendor_id = vendor_id;
	}
	public static int getUser_id() {
		return user_id;
	}
	public static void setUser_id(int user_id) {
		GetterSetter.user_id = user_id;
	}
	public static int getOrder_id() {
		return order_id;
	}
	public static void setOrder_id(int order_id) {
		GetterSetter.order_id = order_id;
	}
	public static int getDelivery_id() {
		return delivery_id;
	}
	public static void setDelivery_id(int delivery_id) {
		GetterSetter.delivery_id = delivery_id;
	}
	public static int getDishes_id() {
		return dishes_id;
	}
	public static void setDishes_id(int dishes_id) {
		GetterSetter.dishes_id = dishes_id;
	}


}
