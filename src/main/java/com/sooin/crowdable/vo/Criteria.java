package com.sooin.crowdable.vo;

public class Criteria {
	private int page;
    private int perPageNum;
    
    public int getPageStart() {
        return (this.page-1)*perPageNum;
    }
    
    public Criteria() {
        this.page = 1;
        this.perPageNum = 9;
    }
    public Criteria(int perPage) {
        this.page = 1;
        this.perPageNum = perPage;
    }
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
    public int getPerPageNum() {
        return perPageNum;
    }
    public void setPerPageNum(int pageCount) {
        int cnt = this.perPageNum;
        if(pageCount != cnt) {
            this.perPageNum = cnt;
        } else {
            this.perPageNum = pageCount;
        }
    }

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}


}
