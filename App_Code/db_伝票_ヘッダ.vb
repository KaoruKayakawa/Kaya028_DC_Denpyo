Imports System.Data
Imports System.Data.SqlClient

Public Class db_伝票_ヘッダ

    Public Shared ReadOnly Property EmptyTable_01 As DataTable
        Get
            Dim sb As StringBuilder = New StringBuilder(1000)
            sb.AppendLine("SELECT TOP(0) *")
            sb.AppendLine("FROM vi_伝票_ヘッダ_1;")

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

    Public Shared Function Select_01(nouDt_from As DateTime, nouDt_to As DateTime, kaisya As String, kaiTenCd As Integer?, bumonCd As Short?, denNo As Double?,
                                     siireCd As Short?, janCd As Double?, denSbt As Byte, denLess As Byte, kakuKbn As Byte, kakuDt As DateTime?) As DataTable
        Dim sb As StringBuilder = New StringBuilder(1000)
        sb.AppendLine("WITH")
        sb.AppendLine(" t1 AS (")
        sb.AppendLine("  SELECT [会社店ｺｰﾄﾞ]")
        sb.AppendLine("  FROM [M_店舗]")
        sb.AppendLine("  WHERE [会社ｺｰﾄﾞ] IN (" + kaisya + ")")
        sb.AppendLine("   AND ([会社店ｺｰﾄﾞ] = @kaiTenCd OR @kaiTenCd IS NULL)")
        sb.AppendLine(" ),")
        sb.AppendLine(" t2 AS (")
        sb.AppendLine("  SELECT a.*")
        sb.AppendLine("  FROM [vi_伝票_ヘッダ_1] a")
        sb.AppendLine("  INNER JOIN t1")
        sb.AppendLine("  ON a.[会社店ｺｰﾄﾞ] = t1.[会社店ｺｰﾄﾞ]")
        sb.AppendLine("  WHERE (a.[最終納品日] BETWEEN @nouDt_from AND @nouDt_to)")
        sb.AppendLine("   AND (a.[会社店ｺｰﾄﾞ] = @kaiTenCd OR @kaiTenCd IS NULL)")
        sb.AppendLine("   AND (a.[部門ｺｰﾄﾞ] = @bumonCd OR @bumonCd IS NULL)")
        sb.AppendLine("   AND (a.[伝票番号] = @denNo OR @denNo IS NULL)")
        sb.AppendLine("   AND (a.[仕入先ｺｰﾄﾞ] = @siireCd OR @siireCd IS NULL)")

        If (denSbt And 7) = 0 Then
            sb.AppendLine("   AND 0 = 1")
        Else
            Dim vals As String = String.Empty
            If (denSbt And 1) = 1 Then
                vals += ", '01'"
            End If
            If (denSbt And 2) = 2 Then
                vals += ", '02'"
            End If
            If (denSbt And 4) = 4 Then
                vals += ", '03'"
            End If

            sb.AppendLine("   AND a.[伝票種別] IN (" + vals.Substring(2) + ")")
        End If

        If (denLess And 3) = 0 Then
            sb.AppendLine("   AND 0 = 1")
        Else
            Dim vals As String = String.Empty
            If (denLess And 1) = 1 Then
                vals += ", 1"
            End If
            If (denLess And 2) = 2 Then
                vals += ", 0"
            End If

            sb.AppendLine("   AND a.[伝票レス] IN (" + vals.Substring(2) + ")")
        End If

        If (kakuKbn And 3) = 0 Then
            sb.AppendLine("   AND 0 = 1")
        Else
            Dim vals As String = String.Empty
            If (kakuKbn And 1) = 1 Then
                vals += ", 1"
            End If
            If (kakuKbn And 2) = 2 Then
                vals += ", 0"
            End If

            sb.AppendLine("   AND a.[確定区分] IN (" + vals.Substring(2) + ")")
        End If

        sb.AppendLine("   AND (CAST(a.[確定-受信_日時] AS date) = @kakuDt OR @kakuDt IS NULL)")
        sb.AppendLine(" ),")
        sb.AppendLine(" t3 AS (")
        sb.AppendLine("  SELECT DISTINCT [会社店ｺｰﾄﾞ], [部門ｺｰﾄﾞ], [仕入先ｺｰﾄﾞ], [伝票番号]")
        sb.AppendLine("  FROM [F_伝票明細]")
        sb.AppendLine("  WHERE ([JANｺｰﾄﾞ] = @janCd OR @janCd IS NULL)")
        sb.AppendLine("  UNION ALL")
        sb.AppendLine("  SELECT DISTINCT [会社店ｺｰﾄﾞ], [部門ｺｰﾄﾞ], [仕入先ｺｰﾄﾞ], [伝票番号]")
        sb.AppendLine("  FROM [F_入庫受信]")
        sb.AppendLine("  WHERE ([JANｺｰﾄﾞ] = @janCd OR @janCd IS NULL)")
        sb.AppendLine(" )")
        sb.AppendLine("SELECT t2.*")
        sb.AppendLine("FROM t2")
        sb.AppendLine("INNER JOIN t3")
        sb.AppendLine("ON t2.[会社店ｺｰﾄﾞ] = t3.[会社店ｺｰﾄﾞ]")
        sb.AppendLine(" AND t2.[部門ｺｰﾄﾞ] = t3.[部門ｺｰﾄﾞ]")
        sb.AppendLine(" AND t2.[仕入先ｺｰﾄﾞ] = t3.[仕入先ｺｰﾄﾞ]")
        sb.AppendLine(" AND t2.[伝票番号] = t3.[伝票番号]")
        sb.AppendLine("ORDER BY t2.[会社店ｺｰﾄﾞ], t2.[部門ｺｰﾄﾞ], t2.[仕入先ｺｰﾄﾞ], t2.[発注日], t2.[最終納品日], t2.[伝票番号];")

        Dim cn As SqlConnection = New SqlConnection(SettingConfig.ConnectingString)

        Dim cmd As SqlCommand = New SqlCommand() With {
            .Connection = cn,
            .CommandTimeout = Const_App.Db.CmdTimeout,
            .CommandType = CommandType.Text,
            .CommandText = sb.ToString()
            }
        Dim prm As SqlParameter
        prm = cmd.Parameters.Add(New SqlParameter("@nouDt_from", SqlDbType.DateTime))
        prm.Value = nouDt_from
        prm = cmd.Parameters.Add(New SqlParameter("@nouDt_to", SqlDbType.DateTime))
        prm.Value = nouDt_to
        prm = cmd.Parameters.Add(New SqlParameter("@kaiTenCd", SqlDbType.Int))
        If kaiTenCd Is Nothing Then
            prm.Value = DBNull.Value
        Else
            prm.Value = kaiTenCd.Value
        End If
        prm = cmd.Parameters.Add(New SqlParameter("@bumonCd", SqlDbType.SmallInt))
        If bumonCd Is Nothing Then
            prm.Value = DBNull.Value
        Else
            prm.Value = bumonCd.Value
        End If
        prm = cmd.Parameters.Add(New SqlParameter("@denNo", SqlDbType.Float))
        If denNo Is Nothing Then
            prm.Value = DBNull.Value
        Else
            prm.Value = denNo.Value
        End If
        prm = cmd.Parameters.Add(New SqlParameter("@siireCd", SqlDbType.SmallInt))
        If siireCd Is Nothing Then
            prm.Value = DBNull.Value
        Else
            prm.Value = siireCd.Value
        End If
        prm = cmd.Parameters.Add(New SqlParameter("@janCd", SqlDbType.Float))
        If janCd Is Nothing Then
            prm.Value = DBNull.Value
        Else
            prm.Value = janCd.Value
        End If
        prm = cmd.Parameters.Add(New SqlParameter("@kakuDt", SqlDbType.DateTime))
        If kakuDt Is Nothing Then
            prm.Value = DBNull.Value
        Else
            prm.Value = kakuDt.Value
        End If

        Dim adp As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim tbl As DataTable = New DataTable()
        adp.Fill(tbl)

        adp.Dispose()
        cmd.Dispose()
        cn.Dispose()

        Return tbl
    End Function

End Class
