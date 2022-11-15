package gov.mof.CMS.dto;

public class DisposedDto implements Comparable<DisposedDto>{
	private Long itemCount;
	private String itemName;
	public DisposedDto(String itemName,Long itemCount) {
		super();
		this.itemCount = itemCount;
		this.itemName = itemName;
	}
	
	public Long getItemCount() {
		return itemCount;
	}

	public void setItemCount(Long itemCount) {
		this.itemCount = itemCount;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	@Override
	public int compareTo(DisposedDto o) {
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
