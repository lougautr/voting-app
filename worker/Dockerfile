FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /app

COPY . .

RUN dotnet restore

RUN dotnet publish -c release --self-contained false --no-restore

FROM build AS final

WORKDIR /app

COPY --from=build /app/bin/release/net7.0/publish/ .

CMD [ "dotnet", "Worker.dll" ]

