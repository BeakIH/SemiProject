package jdbc;

import java.sql.DriverManager;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.dbcp2.BasicDataSourceFactory;
import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.ObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {

	@Override
	public void init() throws ServletException{
		loadJDBCDriver();
		initConnectionPool();
	}
	
	private void loadJDBCDriver() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);
			// TODO: handle exception
		}
	}// loadJDBCDriver() end
	
	private void initConnectionPool() {
		try {
<<<<<<< HEAD
			String jdbcUrl =  "jdbc:oracle:thin:@localhost:1521:xe";
			String username = "scott";
			String pw = "tiger";
=======
			String jdbcUrl =  "jdbc:oracle:thin:@192.168.40.7:1521:XE";
			String username = "SCOTT1";
			String pw = "TIGER";
>>>>>>> refs/remotes/origin/YJ_CHOI
			
<<<<<<< HEAD
			/* �� �Ʒ� �ڵ���� ������� �״�� ���� �ȴ�. */
=======
			
>>>>>>> refs/remotes/origin/YJ_CHOI
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcUrl, username, pw);
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			poolableConnFactory.setValidationQuery("select 1");
<<<<<<< HEAD
			 //Ŀ�ؼ� Ǯ�� ���� ������ �����Ѵ�.
=======
			
>>>>>>> refs/remotes/origin/YJ_CHOI
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
<<<<<<< HEAD
			//��ȿ Ŀ�ؼ� �˻� �ֱ�
=======
			
>>>>>>> refs/remotes/origin/YJ_CHOI
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
<<<<<<< HEAD
			//Ǯ�� �ִ� Ŀ�ؼ��� ��ȿ���� �˻� ���� ����
=======
			
>>>>>>> refs/remotes/origin/YJ_CHOI
			poolConfig.setTestWhileIdle(true);
<<<<<<< HEAD
			 //Ŀ�ؼ� �ּҰ��� ����
=======
			 
>>>>>>> refs/remotes/origin/YJ_CHOI
			poolConfig.setMinIdle(4);
<<<<<<< HEAD
			  //Ŀ�ؼ� �ִ� ���� ����
=======
			 
>>>>>>> refs/remotes/origin/YJ_CHOI
			poolConfig.setMaxTotal(50);
<<<<<<< HEAD
           //Ŀ�ؼ� Ǯ ����. ���ڷδ� ������ ������  PoolabeConnectionFactory�� GenericObjectPoolConfig�� ����Ѵ�.
=======
          
>>>>>>> refs/remotes/origin/YJ_CHOI
			GenericObjectPool<PoolableConnection> connectionPool = 
					new GenericObjectPool<>(poolableConnFactory, poolConfig);
<<<<<<< HEAD
			//PoolabeConnectionFactory���� Ŀ�ؼ� Ǯ�� ����
=======
			
>>>>>>> refs/remotes/origin/YJ_CHOI
			poolableConnFactory.setPool(connectionPool);
<<<<<<< HEAD
			//Ŀ�ؼ� Ǯ�� �����ϴ� jdbc ����̹��� ���.
=======
			
>>>>>>> refs/remotes/origin/YJ_CHOI
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			
			PoolingDriver driver = 
					(PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
<<<<<<< HEAD
			 //������ Ŀ�ؼ� Ǯ ����̹��� ������ Ŀ�ؼ� Ǯ�� ����Ѵ�. �̸��� pool�̴�.
=======
			
>>>>>>> refs/remotes/origin/YJ_CHOI
											driver.registerPool("pool", connectionPool);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
}
