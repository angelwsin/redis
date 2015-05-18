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
@Table(name="roles",catalog="test")
public class Role implements Serializable{

	private String id;
	private String code;
	private String roleName;
	private int status;
	private Set<User> users;
	private Set<Authority> anthorities;
	
	@Id
   // @GeneratedValue(generator = "generator")
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
	 @Column(name = "roleName", length = 500,nullable=false)
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	 @Column(name = "status", length = 500,nullable=false)
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	//在双向关联中，有且仅有一端作为主体（owner）端存在：主体端负责维护联接列（即更新），
	//对于不需要维护这种关系的从表则通过mappedNy属性进行声明。mappedBy的值指向另一主体的关联属性。例子中，mappedBy的值为users。
	//mappedBy相当于过去的inverse="true".
	//mappedBy 关系的维护端相当于过去的inverse="true".
	//此处使用属性名
	@ManyToMany(cascade={CascadeType.ALL,CascadeType.REFRESH},mappedBy="roles")
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	@ManyToMany(cascade={CascadeType.ALL,CascadeType.MERGE},fetch=FetchType.EAGER)
	@JoinTable(name="role_authorities" ,joinColumns={@JoinColumn(name="id")},inverseJoinColumns={@JoinColumn(name="aid")}) 
	public Set<Authority> getAnthorities() {
		return anthorities;
	}
	public void setAnthorities(Set<Authority> anthorities) {
		this.anthorities = anthorities;
	}
	
	
	

}
