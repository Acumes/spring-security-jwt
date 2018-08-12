package com.htf.common.utils;

import java.util.Collection;

/**
 * 集合判断工具
 * 
 */
public class NullUtil {

	private NullUtil() {
	}

	public static <T> T nvl(T a, T b) {
		return a != null ? a : b;
	}

	public static int length(String str) {
		return str == null ? 0 : str.length();
	}

	public static boolean hasLength(String str) {
		return str != null && !str.isEmpty();
	}

	public static int size(Collection<?> c) {
		return c == null ? 0 : c.size();
	}

	public static boolean hasItem(Collection<?> c) {
		return c != null && !c.isEmpty();
	}

	public static boolean hasItem(Collection<?>... cs) {
		return sumSize(cs) > 0;
	}

	public static int sumSize(Collection<?>... cs) {
		int total = 0;
		for (Collection<?> c : cs)
			if (c != null)
				total += c.size();
		return total;
	}

	@SafeVarargs
	public static <T> Collection<T> addAll(Collection<T> newCollection, Collection<? extends T>... cs) {
		for (Collection<? extends T> c : cs)
			if (c != null && !c.isEmpty())
				newCollection.addAll(c);
		return newCollection;
	}

}