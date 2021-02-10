package config;

import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapClientFactory {

	private static SqlMapClient smc;
	
	static{
		try {
			// 1-1. 문자 인코딩 케릭터셋 설정
			Charset charset = Charset.forName("UTF-8");
			Resources.setCharset(charset);
			
			// 1-2. 환경 설정 파일 읽어오기
			Reader rd = Resources.getResourceAsReader("config/sqlMapConfig.xml");
			
			// 1-3. 위에서 읽어온 Reader객체를 이용하여 실제 환경 설정을 진행한 후 SQL문을
			//		호출해서 실행할 객체를 생성한다.
			smc = SqlMapClientBuilder.buildSqlMapClient(rd);
			rd.close();
		} catch (Exception ex){
			
		}
		
	}
	
	public static SqlMapClient getClient(){
		return smc;
	}
}
