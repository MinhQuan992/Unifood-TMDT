package com.mvc.dao;

import com.mvc.entities.ViewDonHangEntity;
import com.mvc.utility.HibernateUtility;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class ViewOrderDao {
    public List<ViewDonHangEntity> getAllOrder(String userID)
    {
        Transaction transaction = null;
        List<ViewDonHangEntity> listOfOrder = null;
        Session session = HibernateUtility.getSessionFactory().openSession();
        try
        {
            transaction = session.beginTransaction();
            Query<ViewDonHangEntity> query = session.createQuery("FROM ViewDonHangEntity WHERE maNguoiDung=:userID");
            query.setParameter("userID", userID);
            listOfOrder = query.getResultList();
            transaction.commit();
        }
        catch (Exception e)
        {
            if (transaction != null)
            {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally
        {
            session.close();
        }
        return listOfOrder;
    }

    public List<ViewDonHangEntity> getAllOrderManager(String orderStatus)
    {
        Transaction transaction = null;
        List<ViewDonHangEntity> listOfOrder = null;
        Session session = HibernateUtility.getSessionFactory().openSession();

        try
        {
            transaction = session.beginTransaction();
            Query<ViewDonHangEntity> query = session.createQuery("FROM ViewDonHangEntity WHERE ttDonHang=:orderStatus");
            query.setParameter("orderStatus", orderStatus);
            listOfOrder = query.getResultList();
            transaction.commit();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            if (transaction != null)
            {
                transaction.rollback();
            }
        }
        finally
        {
            session.close();
        }

        return listOfOrder;
    }

    public List<ViewDonHangEntity> getAllAcceptedOrders()
    {
        Transaction transaction = null;
        List<ViewDonHangEntity> listOfOrder = null;
        String ttDonHang = "Bàn giao vận chuyển";
        Session session = HibernateUtility.getSessionFactory().openSession();
        try
        {
            transaction = session.beginTransaction();
            Query<ViewDonHangEntity> query = session.createQuery("FROM ViewDonHangEntity WHERE ttDonHang=:ttDonHang");
            query.setParameter("ttDonHang", ttDonHang);
            listOfOrder = query.getResultList();
            transaction.commit();
        }
        catch (Exception e)
        {
            if (transaction != null)
            {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally
        {
            session.close();
        }
        return listOfOrder;
    }

    public List<ViewDonHangEntity> getAllShippingOrders(String shipperID)
    {
        Transaction transaction = null;
        List<ViewDonHangEntity> listOfOrder = null;
        String ttDonHang = "Đang vận chuyển";
        Session session = HibernateUtility.getSessionFactory().openSession();
        try
        {
            transaction = session.beginTransaction();
            Query<ViewDonHangEntity> query = session.createQuery("FROM ViewDonHangEntity WHERE ttDonHang=:ttDonHang AND maNguoiVanChuyen=:shipperID");
            query.setParameter("ttDonHang", ttDonHang);
            query.setParameter("shipperID", shipperID);
            listOfOrder = query.getResultList();
            transaction.commit();
        }
        catch (Exception e)
        {
            if (transaction != null)
            {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally
        {
            session.close();
        }
        return listOfOrder;
    }

    public List<ViewDonHangEntity> getAllDeliveredOrders(String shipperID)
    {
        Transaction transaction = null;
        List<ViewDonHangEntity> listOfOrder = null;
        String ttDonHang = "Giao hàng thành công";
        Session session = HibernateUtility.getSessionFactory().openSession();
        try
        {
            transaction = session.beginTransaction();
            Query<ViewDonHangEntity> query = session.createQuery("FROM ViewDonHangEntity WHERE ttDonHang=:ttDonHang AND maNguoiVanChuyen=:shipperID");
            query.setParameter("ttDonHang", ttDonHang);
            query.setParameter("shipperID", shipperID);
            listOfOrder = query.getResultList();
            transaction.commit();
        }
        catch (Exception e)
        {
            if (transaction != null)
            {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally
        {
            session.close();
        }
        return listOfOrder;
    }
}
