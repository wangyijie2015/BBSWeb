

using MyBBSWebApi.BLL;
using MyBBSWebApi.BLL.Interfaces;

var builder = WebApplication.CreateBuilder(args);

//������ÿ���
builder.Services.AddCors(c => c.AddPolicy("any", p => p.AllowAnyHeader().AllowAnyOrigin().AllowAnyMethod()));
builder.Services.AddSingleton<IUsersBLL, UsersBLL>(); //����ע�� IUsersBLL
builder.Services.AddSingleton<IPostsBLL, PostsBLL>(); //����ע�� IPostsBLL
// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.UseCors();//ʹ�ÿ���

app.MapControllers();

app.Run();
