package com.deepash.respository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.deepash.modal.MessageBean;

@Repository
public interface MessageRepository extends PagingAndSortingRepository<MessageBean, Integer> {

//	public List<MessageBean> getAllMsg(Pageable p, Sort sort);

	@Query("select a from MessageBean a where a.type='normal' ")
	public List<MessageBean> getAllNormal(Pageable p);
	@Query("select a from MessageBean a where a.type='normal' ")
	public List<MessageBean> getAllNormalSize();

	@Query("select a from MessageBean a where a.type='kavithai' ")
	public List<MessageBean> getAllKavithai(Pageable p);

	@Query("select a from MessageBean a where a.type='kavithai'")
	public List<MessageBean> getAllKavithaiSize();
	@Query("select a from MessageBean a ")
	public List<MessageBean> getAllSize();

}
