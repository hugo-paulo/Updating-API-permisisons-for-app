Connect-MgGraph -Scope "Application.ReadWrite.All"

$applicationId = "b770a640-9b1f-46ad-af6a-e24ee33759fa"

$params = @{
	RequiredResourceAccess = @{
                                #Current API permission (MS Graph)
                                ResourceAppId = "00000003-0000-0000-c000-000000000000"
                                ResourceAccess = @{
                                                        #get id from app/id looking for the ids of API scopes (oauth2PermissionScopes)
                                                        ID = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
                                                        Type = "Scope"
                                                    },
                                                   @{}
                              },
                             @{
                                 #new assignment
                                 #app id of App A
                                 ResourceAppId = "fc3eaf2f-5dc4-41d8-801d-e87bb470e778"
                                 ResourceAccess = @{
                                                        #get id from app/id looking for the ids of API scopes (oauth2PermissionScopes)
                                                        ID = "b9029732-c308-41e3-9049-b8febab10087"
                                                        Type = "Scope"
                                                    },
                                                   @{
                                                        #get id from app/id looking for the ids of API scopes (oauth2PermissionScopes)
                                                        ID = "16c23715-acbf-45f5-be10-084576f29559"
                                                        Type = "Role"
                                                    }

                               }
                             
}


Update-MgApplication -ApplicationId $applicationId -BodyParameter $params -debug

Get-MgApplication -ApplicationId $applicationId