package core;

import data.DataComment; 
import entity.Comment;
import entity.Error;
import java.util.ArrayList;
abstract class ICommentService 
{ 
    abstract ArrayList<Comment> showComment(String str);

    abstract boolean insertComment(Comment comm, Error err);
    
}


public class ServiceComment extends ICommentService
{
    private static DataComment dataComment=null;
    public ServiceComment()
    {
        if (ServiceComment.dataComment == null)
        {
            ServiceComment.dataComment = new DataComment();
        }  
    }
    public ArrayList<Comment> showComment(String str)
    {
        return ServiceComment.dataComment.CommentData(str); 
    }

    public boolean insertComment(Comment comm, Error err)
    {
        return ServiceComment.dataComment.InsertComment(comm,err); 
    }
}