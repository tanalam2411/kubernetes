package com.mydeveloperplanet.myliquibaseplanet;

import com.mydeveloperplanet.myliquibaseplanet.dao.EmployeeDao;
import com.mydeveloperplanet.myliquibaseplanet.domain.Employee;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.springframework.test.jdbc.JdbcTestUtils;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@ActiveProfiles("test")
@AutoConfigureMockMvc
@Testcontainers
class MyliquibasePlanetApplicationTests {

	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private EmployeeDao employeeDao;

	@Test
	void contextLoads() {
	}

	@Test
	public void getAllEmployees() throws Exception {
		this.mockMvc.perform(get("/getAllEmployees"))
				    .andDo(print())
				    .andExpect(status().isOk())
				    .andExpect(content().json("[{\"id\":1,\"firstName\":\"Foo\",\"lastName\":\"Bar\",\"country\":\"Sweden\"}]"));
	}

	@Test
	@Transactional
	public void addEmployee() throws Exception {
		int rowsBefore = JdbcTestUtils.countRowsInTable(jdbcTemplate, "Employee");

		this.mockMvc.perform(post("/addEmployee")
			    	.param("firstName", "John")
				    .param("lastName", "Doe")
				    .param("country", "Belgium"))
				    .andDo(print())
				    .andExpect(status().isOk())
				    .andExpect((content().string("Saved Employee")));

		int rowsAfter = JdbcTestUtils.countRowsInTable(jdbcTemplate, "Employee");

		Employee result = employeeDao.getEmployee("John", "Doe", "Belgium");
		Assert.notNull(result, "No result available");
		Assert.isTrue(rowsBefore + 1 == rowsAfter, "Employee is not added");
	}

}
