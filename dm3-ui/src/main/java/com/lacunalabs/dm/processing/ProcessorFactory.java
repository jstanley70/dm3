package com.lacunalabs.dm.processing;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lacunalabs.dm.processing.translators.ITranslator;

public class ProcessorFactory {
	
	static private ApplicationContext context= new ClassPathXmlApplicationContext("processors.xml");
	
	public static Object process(String processName, String translatorName, Object data)
	{
		IProcessor processor = (IProcessor)context.getBean(processName);
		ITranslator translator = (ITranslator)context.getBean(translatorName);
		return processor.process(translator.translate(data));
	}


}
