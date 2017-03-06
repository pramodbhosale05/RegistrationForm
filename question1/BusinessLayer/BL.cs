using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataLayer;

namespace BusinessLayer
{
    public class BL
    {
        public static void insertuser(EntitylLayer.EL objel)
        {
            DataLayer.DL.insertdata(objel);
        }


        public static System.Data.DataSet display()
        {
            return DataLayer.DL.display();
        }

        public static int delete(EntitylLayer.EL objel)
        {
            return DataLayer.DL.delete(objel);
        }

        public static int update(EntitylLayer.EL objel)
        {
            return DataLayer.DL.update(objel);
        }
    }
}