package com.jing.myself.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResultInfo<T> {
	private Integer code;
	private T result;
	private String message;
}
