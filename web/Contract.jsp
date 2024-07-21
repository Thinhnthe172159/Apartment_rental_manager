<%-- 
    Document   : Contract
    Created on : Jul 21, 2024, 11:47:33 AM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
		<script src="https://unpkg.com/unlazy@0.11.3/dist/unlazy.with-hashing.iife.js" defer init></script>
		<script type="text/javascript">
			window.tailwind.config = {
				darkMode: ['class'],
				theme: {
					extend: {
						colors: {
							border: 'hsl(var(--border))',
							input: 'hsl(var(--input))',
							ring: 'hsl(var(--ring))',
							background: 'hsl(var(--background))',
							foreground: 'hsl(var(--foreground))',
							primary: {
								DEFAULT: 'hsl(var(--primary))',
								foreground: 'hsl(var(--primary-foreground))'
							},
							secondary: {
								DEFAULT: 'hsl(var(--secondary))',
								foreground: 'hsl(var(--secondary-foreground))'
							},
							destructive: {
								DEFAULT: 'hsl(var(--destructive))',
								foreground: 'hsl(var(--destructive-foreground))'
							},
							muted: {
								DEFAULT: 'hsl(var(--muted))',
								foreground: 'hsl(var(--muted-foreground))'
							},
							accent: {
								DEFAULT: 'hsl(var(--accent))',
								foreground: 'hsl(var(--accent-foreground))'
							},
							popover: {
								DEFAULT: 'hsl(var(--popover))',
								foreground: 'hsl(var(--popover-foreground))'
							},
							card: {
								DEFAULT: 'hsl(var(--card))',
								foreground: 'hsl(var(--card-foreground))'
							},
						},
					}
				}
			}
		</script>
		<style type="text/tailwindcss">
			@layer base {
				:root {
					--background: 0 0% 100%;
--foreground: 240 10% 3.9%;
--card: 0 0% 100%;
--card-foreground: 240 10% 3.9%;
--popover: 0 0% 100%;
--popover-foreground: 240 10% 3.9%;
--primary: 240 5.9% 10%;
--primary-foreground: 0 0% 98%;
--secondary: 240 4.8% 95.9%;
--secondary-foreground: 240 5.9% 10%;
--muted: 240 4.8% 95.9%;
--muted-foreground: 240 3.8% 46.1%;
--accent: 240 4.8% 95.9%;
--accent-foreground: 240 5.9% 10%;
--destructive: 0 84.2% 60.2%;
--destructive-foreground: 0 0% 98%;
--border: 240 5.9% 90%;
--input: 240 5.9% 90%;
--ring: 240 5.9% 10%;
--radius: 0.5rem;
				}
				.dark {
					--background: 240 10% 3.9%;
--foreground: 0 0% 98%;
--card: 240 10% 3.9%;
--card-foreground: 0 0% 98%;
--popover: 240 10% 3.9%;
--popover-foreground: 0 0% 98%;
--primary: 0 0% 98%;
--primary-foreground: 240 5.9% 10%;
--secondary: 240 3.7% 15.9%;
--secondary-foreground: 0 0% 98%;
--muted: 240 3.7% 15.9%;
--muted-foreground: 240 5% 64.9%;
--accent: 240 3.7% 15.9%;
--accent-foreground: 0 0% 98%;
--destructive: 0 62.8% 30.6%;
--destructive-foreground: 0 0% 98%;
--border: 240 3.7% 15.9%;
--input: 240 3.7% 15.9%;
--ring: 240 4.9% 83.9%;
				}
			}
		</style>
  </head>
  <body>
    

<div class="max-w-4xl mx-auto p-6 bg-card text-card-foreground">
  <h2 class="text-center text-xl font-bold mb-6">Thông tin khách hàng</h2>
  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
      <div class="border p-4">
        <img src="https://placehold.co/150x150?text=Ảnh+đại+diện" alt="Customer Avatar" class="w-full mb-4" />
        <button class="w-full bg-secondary text-secondary-foreground hover:bg-secondary/80 py-2">Chọn ảnh</button>
      </div>
    </div>
    <div class="w-full md:w-2/3 px-3">
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="phone">SDT (*)</label>
          <input class="appearance-none block w-full bg-input text-input border rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="phone" type="text" />
        </div>
        <div class="w-full md:w-1/2 px-3">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="name">Họ tên (*)</label>
          <input class="appearance-none block w-full bg-input text-input border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white" id="name" type="text" />
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full px-3">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="email">Email</label>
          <input class="appearance-none block w-full bg-input text-input border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white" id="email" type="email" />
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="dob">Ngày sinh</label>
          <input class="appearance-none block w-full bg-input text-input border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white" id="dob" type="date" />
        </div>
        <div class="w-full md:w-1/2 px-3">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="city">Tỉnh / thành phố</label>
          <select class="block appearance-none w-full bg-input text-input border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white" id="city">
            <option>Chọn tỉnh / thành phố</option>
          </select>
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="district">Quận / huyện</label>
          <select class="block appearance-none w-full bg-input text-input border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white" id="district">
            <option>Chọn quận / huyện</option>
          </select>
        </div>
        <div class="w-full md:w-1/2 px-3">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="ward">Phường / xã</label>
          <select class="block appearance-none w-full bg-input text-input border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white" id="ward">
            <option>Chọn phường / xã</option>
          </select>
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full px-3">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="address">Địa chỉ</label>
          <input class="appearance-none block w-full bg-input text-input border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white" id="address" type="text" />
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full px-3">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="note">Ghi chú (mã vân tay,...)</label>
          <textarea class="appearance-none block w-full bg-input text-input border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white" id="note"></textarea>
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="id-number">CMTND / CCCD</label>
          <input class="appearance-none block w-full bg-input text-input border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white" id="id-number" type="text" />
        </div>
        <div class="w-full md:w-1/2 px-3">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="id-date">Ngày cấp CMTND / CCCD</label>
          <input class="appearance-none block w-full bg-input text-input border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white" id="id-date" type="date" />
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full px-3">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="id-place">Nơi cấp CMTND / CCCD</label>
          <input class="appearance-none block w-full bg-input text-input border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white" id="id-place" type="text" />
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full px-3">
          <label class="block uppercase tracking-wide text-xs font-bold mb-2" for="residence">Tạm trú</label>
          <select class="block appearance-none w-full bg-input text-input border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white" id="residence">
            <option>Chưa khai báo</option>
          </select>
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
          <div class="border p-4">
            <img src="https://placehold.co/150x150?text=Ảnh+CMT+trước" alt="ID Front Image" class="w-full mb-4" />
            <button class="w-full bg-secondary text-secondary-foreground hover:bg-secondary/80 py-2">Chọn ảnh</button>
          </div>
        </div>
        <div class="w-full md:w-1/2 px-3">
          <div class="border p-4">
            <img src="https://placehold.co/150x150?text=Ảnh+CMT+sau" alt="ID Back Image" class="w-full mb-4" />
            <button class="w-full bg-secondary text-secondary-foreground hover:bg-secondary/80 py-2">Chọn ảnh</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="flex justify-between items-center border-t pt-4">
    <button class="bg-primary text-primary-foreground hover:bg-primary/80 py-2 px-4 rounded">Thêm xe sở hữu</button>
    <div>
      <button class="bg-destructive text-destructive-foreground hover:bg-destructive/80 py-2 px-4 rounded">Hủy</button>
      <button class="bg-primary text-primary-foreground hover:bg-primary/80 py-2 px-4 rounded ml-2">Lưu</button>
    </div>
  </div>
</div>


  </body>
</html>