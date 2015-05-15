package com.wsin.security.bean;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="authorities")
public class Authority implements Serializable{
	
	 private String id;
	 private String code;
	 private String anthorityName;
	 private int status;
	 private Set<Role> roles;
	 private Set<Resource> resources;
	 @Id
	 @Column(name = "id", unique = true, nullable = false)
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	 @Column(name = "code", length = 500,nullable=false)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	 @Column(name = "anthorityName", length = 500,nullable=false)
	public String getAnthorityName() {
		return anthorityName;
	}
	public void setAnthorityName(String anthorityName) {
		this.anthorityName = anthorityName;
	}
	@Column(name = "status", length = 500,nullable=false)
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@ManyToMany(cascade=CascadeType.REFRESH,mappedBy="anthorities")
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	@ManyToMany(cascade={CascadeType.PERSIST,CascadeType.MERGE},fetch=FetchType.LAZY)
	@JoinTable(name="authorities_resources" ,joinColumns={@JoinColumn(name="id")},inverseJoinColumns={@JoinColumn(name="rid")}) 
	public Set<Resource> getResources() {
		return resources;
	}
	public void setResources(Set<Resource> resources) {
		this.resources = resources;
	}
	 
	 

}
