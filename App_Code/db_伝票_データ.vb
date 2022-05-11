Imports System.Data
Imports System.Data.SqlClient

Public Class db_伝票_データ

    Public Shared ReadOnly Property EmptyTable_01 As DataTable
        Get
            Dim sb As StringBuilder = New StringBuilder(1000)
            sb.AppendLine("SELECT TOP(0) *")
            sb.AppendLine("FROM vi_伝票_データ_1;")

            Dim cn As SqlConnection = New SqlConnection(SettingConfig.ConnectingString)
            Dim cmd As SqlCommand = New SqlCommand() With {
                .Connection = cn,
                .CommandTimeout = Const_App.Db.CmdTimeout,
                .CommandType = CommandType.Text,
                .CommandText = sb.ToString()
                }

            Dim adp As SqlDataAdapter = New SqlDataAdapter(cmd)
            Dim tbl As DataTable = New DataTable()

            adp.Fill(tbl)

            adp.Dispose()
            cmd.Dispose()
            cn.Dispose()

            tbl.TableName = "EmptyTable_01"

            Return tbl
        End Get
    End Property

    Public Shared Function Select_01(kaiTenCd As Integer, bumonCd As Short, siireCd As Short, denNo As Double) As DataTable
        Dim sb As StringBuilder = New StringBuilder(1000)
        sb.AppendLine("SELECT *")
        sb.AppendLine("FROM vi_伝票_データ_1")
        sb.AppendLine("WHERE [会社店ｺｰﾄﾞ] = @kaiTenCd")
        sb.AppendLine(" AND [部門ｺｰﾄﾞ] = @bumonCd")
        sb.AppendLine(" AND [仕入先ｺｰﾄﾞ] = @siireCd")
        sb.AppendLine(" AND [伝票番号] = @denNo")
        sb.AppendLine("ORDER BY [行番号];")

        Dim cn As SqlConnection = New SqlConnection(SettingConfig.ConnectingString)

        Dim cmd As SqlCommand = New SqlCommand() With {
            .Connection = cn,
            .CommandTimeout = Const_App.Db.CmdTimeout,
            .CommandType = CommandType.Text,
            .CommandText = sb.ToString()
            }
        Dim prm As SqlParameter
        prm = cmd.Parameters.Add(New SqlParameter("@kaiTenCd", SqlDbType.Int))
        prm.Value = kaiTenCd
        prm = cmd.Parameters.Add(New SqlParameter("@bumonCd", SqlDbType.SmallInt))
        prm.Value = bumonCd
        prm = cmd.Parameters.Add(New SqlParameter("@siireCd", SqlDbType.SmallInt))
        prm.Value = siireCd
        prm = cmd.Parameters.Add(New SqlParameter("@denNo", SqlDbType.Float))
        prm.Value = denNo

        Dim adp As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim tbl As DataTable = New DataTable()
        adp.Fill(tbl)

        adp.Dispose()
        cmd.Dispose()
        cn.Dispose()

        Return tbl
    End Function

End Class
