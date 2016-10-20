package ljf.service;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;



public interface BaseService<T> {
	
	//ͨ��hqlFilter��ûʵ��

	/**
	 * ����һ������
	 * 
	 * @param o
	 *            ����
	 * @return �����ID
	 */
	public Serializable save(T o);

	/**
	 * ɾ��һ������
	 * 
	 * @param o
	 *            ����
	 */
	public void delete(T o);

	/**
	 * ����һ������
	 * 
	 * @param o
	 *            ����
	 */
	public void update(T o);

	/**
	 * ��������һ������
	 * 
	 * @param o
	 *            ����
	 */
	public void saveOrUpdate(T o);

	/**
	 * ͨ��������ö���
	 * 
	 * @param c
	 *            ����.class
	 * @param id
	 *            ����
	 * @return ����
	 */
	public T getById(Serializable id);

	/**
	 * ͨ��HQL����ȡһ������
	 * 
	 * @param hql
	 *            HQL���
	 * @return ����
	 */
	public T getByHql(String hql);

	/**
	 * ͨ��HQL����ȡһ������
	 * 
	 * @param hql
	 *            HQL���
	 * @param params
	 *            ����
	 * @return ����
	 */
	public T getByHql(String hql, Map<String, Object> params);

	/**
	 * ͨ��HqlFilter��ȡһ������
	 * 
	 * @param hqlFilter
	 * @return
	 */
//	public T getByFilter(HqlFilter hqlFilter);

	/**
	 * ��ö����б�
	 * 
	 * @return
	 */
	public List<T> find();

	/**
	 * ��ö����б�
	 * 
	 * @param hql
	 *            HQL���
	 * @return List
	 */
	public List<T> find(String hql);

	/**
	 * ��ö����б�
	 * 
	 * @param hql
	 *            HQL���
	 * @param params
	 *            ����
	 * @return List
	 */
	public List<T> find(String hql, Map<String, Object> params);

	/**
	 * ��ö����б�
	 * 
	 * @param hqlFilter
	 * @return
	 */
//	public List<T> findByFilter(HqlFilter hqlFilter);

	/**
	 * ��÷�ҳ��Ķ����б�
	 * 
	 * @param hql
	 *            HQL���
	 * @param page
	 *            Ҫ��ʾ�ڼ�ҳ
	 * @param rows
	 *            ÿҳ��ʾ������
	 * @return List
	 */
	public List<T> find(String hql, int page, int rows);

	/**
	 * ��÷�ҳ��Ķ����б�
	 * 
	 * @param hql
	 *            HQL���
	 * @param params
	 *            ����
	 * @param page
	 *            Ҫ��ʾ�ڼ�ҳ
	 * @param rows
	 *            ÿҳ��ʾ������
	 * @return List
	 */
	public List<T> find(String hql, Map<String, Object> params, int page, int rows);

	/**
	 * ��÷�ҳ��Ķ����б�
	 * 
	 * @param page
	 * @param rows
	 * @return
	 */
	public List<T> find(int page, int rows);

	/**
	 * ��÷�ҳ��Ķ����б�
	 * 
	 * @param hqlFilter
	 * @param page
	 * @param rows
	 * @return
	 */
//	public List<T> findByFilter(HqlFilter hqlFilter, int page, int rows);

	/**
	 * ͳ����Ŀ
	 * 
	 * @param hql
	 *            HQL���(select count(*) from T)
	 * @return long
	 */
	public Long count(String hql);

	/**
	 * ͳ����Ŀ
	 * 
	 * @param hql
	 *            HQL���(select count(*) from T where xx = :xx)
	 * @param params
	 *            ����
	 * @return long
	 */
	public Long count(String hql, Map<String, Object> params);

	/**
	 * ͳ����Ŀ
	 * 
	 * @param hqlFilter
	 * @return
	 */
//	public Long countByFilter(HqlFilter hqlFilter);

	/**
	 * ͳ����Ŀ
	 * 
	 * @return long
	 */
	public Long count();

	/**
	 * ִ��һ��HQL���
	 * 
	 * @param hql
	 *            HQL���
	 * @return ��Ӧ�����Ŀ
	 */
	public int executeHql(String hql);

	/**
	 * ִ��һ��HQL���
	 * 
	 * @param hql
	 *            HQL���
	 * @param params
	 *            ����
	 * @return ��Ӧ�����Ŀ
	 */
	public int executeHql(String hql, Map<String, Object> params);

	/**
	 * ��ý����
	 * 
	 * @param sql
	 *            SQL���
	 * @return �����
	 */
	public List findBySql(String sql);

	/**
	 * ��ý����
	 * 
	 * @param sql
	 *            SQL���
	 * @param page
	 *            Ҫ��ʾ�ڼ�ҳ
	 * @param rows
	 *            ÿҳ��ʾ������
	 * @return �����
	 */
	public List findBySql(String sql, int page, int rows);

	/**
	 * ��ý����
	 * 
	 * @param sql
	 *            SQL���
	 * @param params
	 *            ����
	 * @return �����
	 */
	public List findBySql(String sql, Map<String, Object> params);

	/**
	 * ��ý����
	 * 
	 * @param sql
	 *            SQL���
	 * @param params
	 *            ����
	 * @param page
	 *            Ҫ��ʾ�ڼ�ҳ
	 * @param rows
	 *            ÿҳ��ʾ������
	 * @return �����
	 */
	public List findBySql(String sql, Map<String, Object> params, int page, int rows);

	/**
	 * ִ��SQL���
	 * 
	 * @param sql
	 *            SQL���
	 * @return ��Ӧ����
	 */
	public int executeSql(String sql);

	/**
	 * ִ��SQL���
	 * 
	 * @param sql
	 *            SQL���
	 * @param params
	 *            ����
	 * @return ��Ӧ����
	 */
	public int executeSql(String sql, Map<String, Object> params);

	/**
	 * ͳ��
	 * 
	 * @param sql
	 *            SQL���
	 * @return ��Ŀ
	 */
	public BigInteger countBySql(String sql);

	/**
	 * ͳ��
	 * 
	 * @param sql
	 *            SQL���
	 * @param params
	 *            ����
	 * @return ��Ŀ
	 */
	public BigInteger countBySql(String sql, Map<String, Object> params);
}
