package com.core;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;


public class DynamicDataSource extends AbstractRoutingDataSource {

	@Override
	protected Object determineCurrentLookupKey() {
		// TODO Auto-generated method stub
		 return DatabaseContextHolder.getCustomerType();
	}
}
