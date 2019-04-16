SELECT RF.[Request_Facts_Key]
      ,[Request_Number]
      ,[Date_Received]
      ,[Date_Entered]
      ,[Date_Respond_By]
      ,[Date_Responded]
      ,[System_Completion_Date]
      ,[Date_Priority_Modified]
      ,[Service_Date]
      ,[Priority]
      ,rf.[Status]
      ,[Status_Description]
      ,[Contact_Type_Code]
      ,[Contact_Type_Description]
      ,[Requestor_Type_Code]
      ,[Requestor_Type_Description]
      ,[Actioning_Officer_ID]
      ,[Actioning_Officer]
      ,[Responsible_Officer_ID]
      ,[Responsible_Officer]
      ,[Receiving_Officer_ID]
      ,[Receiving_Officer]
      ,[Duration]
      ,[Time_Taken]
      ,[Time_Taken_Units]
      ,[Standard_Duration]
      ,[Request_Source]
      ,[Complete_Status_Source]
	  ,NL.Names_Key
      ,Q.[Question]					/**Getting the Questions asked**/
      ,Q.[Answer]					/**Getting the response to Questions**/
	 ,RT.[Request_Type_Description]	/**Getting the description of type of work**/
	 ,P.Suburb						/**Get the suburb **/
	 ,P.Formatted_Address			/**Get the formatted address**/
	 ,GIS.GIS_Reference				/**Get the GIS Reference**/
/** Adding the Names key **/
  FROM [KCC_DataWarehouse].[dbo].[INFOPROD_Request_Facts] RF
  inner join [KCC_DataWarehouse].[dbo].[INFOPROD_Request_Names_Link] NL with(nolock) 
  on RF.Request_Facts_Key = NL.Request_Facts_Key 
  /**Normalising questions**/
  inner join [KCC_DataWarehouse].[dbo].[INFOPROD_Request_Questions] Q with(nolock)
  on RF.Request_Facts_Key = Q.Request_Facts_Key
  /*Getting the location */
  left join [KCC_DataWarehouse].[dbo].[INFOPROD_Request_Property_Link] PL with(nolock)
  on RF.Request_Facts_Key = PL.Request_Facts_Key
  left join [KCC_DataWarehouse].[dbo].[INFOPROD_Property] P with(nolock)
  on PL.Property_Key = P.Property_key
  left join [KCC_DataWarehouse].[dbo].[INFOPROD_GIS_property] GIS with(nolock)
  on GIS.GIS_Property_Key = PL.Property_Key
  /*Getting the Request Type*/
  inner join [KCC_DataWarehouse].[dbo].[INFOPROD_Request_Type] RT with(nolock)
  on RF.Request_Type_Key = RT.Request_Type_Key

  where RF.Date_Received like '%2019%' and Status_Description ='Open'
