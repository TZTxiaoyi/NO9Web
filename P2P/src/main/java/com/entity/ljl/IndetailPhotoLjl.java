package com.entity.ljl;

public class IndetailPhotoLjl {
	private int photoid;
	private int projectsid;
	private int places;
	private String url;
	private int initialindex;
	
	public int getInitialindex() {
		return initialindex;
	}
	public void setInitialindex(int initialindex) {
		this.initialindex = initialindex;
	}
	public int getPhotoid() {
		return photoid;
	}
	public void setPhotoid(int photoid) {
		this.photoid = photoid;
	}
	
	public int getProjectsid() {
		return projectsid;
	}
	public void setProjectsid(int projectsid) {
		this.projectsid = projectsid;
	}
	public int getPlaces() {
		return places;
	}
	public void setPlaces(int places) {
		this.places = places;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
