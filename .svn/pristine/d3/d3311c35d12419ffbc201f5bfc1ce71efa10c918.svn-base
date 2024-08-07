package com.integrosys.cms.batch.feeds.property;

import java.util.Map;

import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.mapping.FieldSetMapper;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.core.JdbcTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

public class PropertyFileLoaderTest extends CustomHibernateTestCase {

	private JdbcTemplate jdbcTemplate;

	public PropertyFileDAO propertyDao;

	public String ENTITY_NAME = "actualValuation";

	public FlatFileItemReader readPropertyFile;

	private FieldSetMapper fieldSetMapper;

	private PropertyFileLoader propertyLoader;

	private Resource resource;

	private Map context;

	public void setUp() {

		super.setUp();

		context = null;
		propertyDao = new PropertyFileDAO();
		readPropertyFile = new FlatFileItemReader();
		fieldSetMapper = new PropertyFieldSetMapperImpl();
		propertyLoader = new PropertyFileLoader();
		resource = new ClassPathResource("testBatchProperty.csv");

		propertyDao.setSessionFactory(getSessionFactory());
		jdbcTemplate = new JdbcTemplate(getDataSource());
	}

	protected String[] getMappingResources() {
		return new String[] { "valuation.hbm.xml" };
	}

	public void testDoWork() throws Exception {

		readPropertyFile.setFieldSetMapper(fieldSetMapper);
		readPropertyFile.setResource(resource);
		readPropertyFile.setFirstLineIsHeader(true);

		propertyLoader.setPropertyFileReader(readPropertyFile);
		propertyLoader.setPropertyFileDao(propertyDao);

		propertyLoader.execute(context);

		int count = jdbcTemplate.queryForInt("select count(*) from CMS_VALUATION");
		assertEquals(7, count);

	}
}
