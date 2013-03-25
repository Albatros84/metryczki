class AddNumerKsiegowyHistoryIdToProject < ActiveRecord::Migration
  def self.up
      add_column :projects, :numer_ks_history_id, :integer
      a=:numer_ks_history_id.to_s
        fk="fk_"+a.to_s+"_histories" 
      a="("+a.to_s+")"                       
      str= <<-SQL
      ALTER TABLE projects ADD CONSTRAINT       
      SQL
      str1=<<-SQL
          FOREIGN KEY 
      SQL
      str2=a
      str3=<<-SQL
        REFERENCES field_histories(id)
      SQL
      query=str+fk+str1+str2+str3
      query.gsub!("/n","")
      execute query  
  end
  
  def self.down
      a=:numer_ks_history_id.to_s
      fk="fk_"+a.to_s+"_histories" 
      a="("+a.to_s+")"                       
      str= <<-SQL
      ALTER TABLE projects DROP FOREIGN KEY       
      SQL
    
     query=str+fk
     query.gsub!("/n","")
     execute query 
    remove_column :projects, :numer_ks_history_id
  end  
end
