package TestForServletJP;

import javax.servlet.http.HttpServlet;

public class Order  extends HttpServlet{
	
		private String menu;
		private int num;
		private int price;
	
		public String getMenu() {
			return menu;
		}
		public void setMenu(String menu) {
			this.menu = menu;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public Order(String menu, int num, int price) {
			this.setMenu(menu);
			this.setNum(num);
			this.setPrice(price);
		}
		public Order() {
		}
		
		@Override
	    public int hashCode() {
	        return (this.menu+this.num+this.price).hashCode();
	    }
		 @Override
		    public boolean equals(Object obj) {
		        //p1.equals(p2)
		        if(obj instanceof Order) {
		            Order p = (Order)obj;
		            return this.hashCode()==p.hashCode(); 
		            
		        }
		        return false;
		    }
}
