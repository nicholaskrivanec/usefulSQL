use master 
go


begin transaction
	exec sp_MSforeachdb 'use ? if exists(select null from information_schema.columns where table_name = ''event'' and column_name like ''time_entry_control%'')
						select table_catalog, data_type from information_schema.columns where table_name = ''event'' and column_name like ''time_entry_control%'''
rollback