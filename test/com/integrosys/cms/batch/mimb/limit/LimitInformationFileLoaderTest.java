package com.integrosys.cms.batch.mimb.limit;

import java.util.Map;

import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.mapping.FieldSetMapper;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.core.JdbcTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

public class LimitInformationFileLoaderTest extends CustomHibernateTestCase {

	private JdbcTemplate jdbcTemplate;

	private FlatFileItemReader readLimitInfoFile;

	private LimitInformationFileDAO limitInfoFileDAO;

	private Resource resource;

	private FieldSetMapper fieldSetMapper;

	private LimitInformationFileLoader limitInfoFileLoader;

	private Map context;

	public void setUp() {
		super.setUp();

		context = null;
		limitInfoFileDAO = new LimitInformationFileDAO();
		readLimitInfoFile = new FlatFileItemReader();
		resource = new ClassPathResource("testLimitInformation.csv");
		fieldSetMapper = new LimitInformationFieldSetMapperImpl();
		limitInfoFileLoader = new LimitInformationFileLoader();
		jdbcTemplate = new JdbcTemplate(getDataSource());

		limitInfoFileDAO.setSessionFactory(getSessionFactory());
	}

	protected String[] getMappingResources() {
		return new String[] { "Batch-Feed-MIMB.hbm.xml" };
	}

	public void testDoWork() {

		readLimitInfoFile.setFieldSetMapper(fieldSetMapper);
		readLimitInfoFile.setResource(resource);
		readLimitInfoFile.setFirstLineIsHeader(false);

		limitInfoFileLoader.setLimitInfoFileReader(readLimitInfoFile);
		limitInfoFileLoader.setLimitInfoFileDAO(limitInfoFileDAO);

		limitInfoFileLoader.execute(context);

		int count = jdbcTemplate.queryForInt("select count(*) from SI_TEMP_MIMB_CA003");
		assertEquals(7, count);
	}

}
