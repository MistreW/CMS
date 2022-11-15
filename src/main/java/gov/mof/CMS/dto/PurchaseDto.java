package gov.mof.CMS.dto;

public class PurchaseDto implements Comparable<PurchaseDto>{
private Double itemCount;
private String itemName;
public PurchaseDto(String itemName,Double itemCount) {
	super();
	this.itemCount = itemCount;
	this.itemName = itemName;
}
public Double getItemCount() {
	return itemCount;
}
public void setItemCount(Double itemCount) {
	this.itemCount = itemCount;
}
public String getItemName() {
	return itemName;
}
public void setItemName(String itemName) {
	this.itemName = itemName;
}
@Override
public int compareTo(PurchaseDto o) {
	int x=0;
	if (this.itemCount-o.itemCount>0)
		x=-1;
	if (this.itemCount-o.itemCount==0)
		x=0;
	if (this.itemCount-o.itemCount<0)
		x=1;
	
	return x;
}


}
