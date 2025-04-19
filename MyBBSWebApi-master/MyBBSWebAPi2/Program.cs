

using MyBBSWebApi.BLL;
using MyBBSWebApi.BLL.Interfaces;

var builder = WebApplication.CreateBuilder(args);

//∫Û∂À≈‰÷√øÁ”Ú
builder.Services.AddCors(c => c.AddPolicy("any", p => p.AllowAnyHeader().AllowAnyOrigin().AllowAnyMethod()));
builder.Services.AddSingleton<IUsersBLL, UsersBLL>(); //“¿¿µ◊¢»Î IUsersBLL
builder.Services.AddSingleton<IPostsBLL, PostsBLL>(); //“¿¿µ◊¢»Î IPostsBLL
// Add services to the container.

builder.Services.AddControllers();
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

app.UseCors();// π”√øÁ”Ú

app.MapControllers();

app.Run();
