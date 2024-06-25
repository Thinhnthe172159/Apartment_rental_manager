<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style.css">
    <script type="module" src="https://cdn.jsdelivr.net/npm/emoji-picker-element@^1/index.js">
        const textarea = document
            .querySelector('#post-desc');
        const postBtn = document
            .querySelector('.post-btn');
        const postAudienceBtn = document
            .querySelector('.post-audience');
        const backBtn = document.
            querySelector('.arrow-left-icon');
        const createPostSection = document.
            querySelector('.create-post');
        const postAudienceSection = document.
            querySelector('.post-audience-section');
        const emojiBtn = document.
            querySelector('.emoji');
        const emojiPicker = document.
            querySelector('emoji-picker');
        const audienceOptions = document.
            querySelectorAll(".audience-option");
        const radioBtns = document.
            querySelectorAll(".audience-option-radio");

        document.body.style.overflowX = 'none';

        textarea.addEventListener("input", () => {
            if (textarea.value != '')
                postBtn.disabled = false;
            else
                postBtn.disabled = true;
        })
        emojiBtn.addEventListener("click", () => {
            if (emojiPicker.style.display == 'none')
                emojiPicker.style.display = 'block';
            else
                emojiPicker.style.display = 'none';
        })
        emojiPicker.addEventListener('emoji-click', e => {
            textarea.value += e.detail.unicode;
        })
        postAudienceBtn.addEventListener('click', () => {
            document.querySelector('.wrapper')
                .classList.add('wrapper-active');
            postAudienceSection.style.display = 'block';
            createPostSection.style.display = 'none';
        })
        audienceOptions.forEach(option => {
            option.addEventListener('click', e => {
                if (!option.classList.contains('active')) {
                    option.classList.add('active');
                    e.currentTarget.children[1]
                        .children[0].children[0].checked = true;
                }
                for (let i = 0; i < audienceOptions.length; i++) {
                    if (e.currentTarget != audienceOptions[i]) {
                        audienceOptions[i].classList
                            .remove('active');
                        radioBtns[i].checked = false;
                    }
                }
            })
        })
        backBtn.addEventListener('click', () => {
            document.querySelector('.wrapper')
                .classList.remove('wrapper-active');
            postAudienceSection.style.display = 'none';
            createPostSection.style.display = 'block';
        })

    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap');

        body {
            font-family: 'Inter', sans-serif;
        }

        .post {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .wrapper {
            height: 30rem;
            transition: height 0.2s ease;
        }

        .wrapper.wrapper-active {
            height: 20rem;
        }

        .create-post {
            border-radius: 5px;
            -webkit-box-shadow: 0 0 5px 1px grey;
            box-shadow: 0 0 5px 1px grey;

        }

        .header {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-right: 1.5rem;
        }

        .header::before,
        h1,
        .cross-icon {
            content: '';
            flex-basis: 100%;
        }

        .header::after {
            content: "";
            position: absolute;
            width: 100%;
            height: 1px;
            bottom: -0.25rem;
            left: 0;
            background-color: rgb(193, 190, 190);
        }

        h1 {
            text-align: center;
        }

        .cross-icon {
            text-align: right;
        }

        .cross-icon-mark {
            cursor: pointer;
            padding: 0.35rem;
            border-radius: 50%;
            background-image: url(https://static.xx.fbcdn.net/rsrc.php/v3/yY/r/fCbUcoRfiez.png);
            background-position: 3.5px -483.5px;
            background-size: 26px 1031px;
            width: 15px;
            height: 15px;
            background-repeat: no-repeat;
            display: inline-block;
        }

        .friends-icon {
            background-image: url(https://static.xx.fbcdn.net/rsrc.php/v3/yZ/r/4qsdCsLNqKi.png);
            width: 14px;
            height: 14px;
            background-position: center;
            background-size: 100% auto;
            background-repeat: no-repeat;
            object-fit: cover;
            object-position: 50% 50%;
        }

        .drop-down {
            background-image: url(https://static.xx.fbcdn.net/rsrc.php/v3/yY/r/fCbUcoRfiez.png);
            background-position: 0px -980px;
            background-size: 26px 994px;
            width: 12px;
            height: 12px;
            background-repeat: no-repeat;
            display: inline-block;
            transform: scale(1.1);
        }

        .post-header {
            padding: 1.5rem;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .profile-pic {
            width: 3.5rem;
            height: 3.5rem;
            background-color: green;
            background-position: center;
            background-repeat: no-repeat;
            background-size: auto 80%;
            border-radius: 50%;
        }

        .full-name {
            margin-bottom: 0.3rem;
        }

        .post-audience {
            cursor: pointer;
            background-color: #e4e6eb;
            display: flex;
            align-items: center;
            gap: 0.25rem;
            justify-content: space-around;
            padding: 0.25rem;
            border-radius: 5px;
        }

        .fa-sort-down {
            margin-bottom: 0.5rem;
        }

        .post-audience:hover {
            background-color: #d9dce3;
        }

        .post-content {
            padding: 0 1.5rem 1.5rem 1.5rem;
        }

        textarea {
            font-family: 'Inter', sans-serif;
            font-size: 1.25rem;
            width: 100%;
            border: none;
            resize: none;
            outline: none;
            line-height: 1.25;
        }

        .emoji-picker {
            text-align: right;
            margin-bottom: 1rem;
            position: relative;
        }

        emoji-picker {
            display: none;
            position: absolute;
            right: 0;
            top: -26rem;
            left: 65%;
        }

        .emoji {
            border-radius: 50%;
            cursor: pointer;
        }

        .add-to-your-post {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 7rem;
            border: 1px solid rgb(193, 190, 190);
            padding: 1.25rem 1rem;
            border-radius: 5px;
        }

        .add-to-post-text {
            font-weight: bold;
        }

        .add-to-post-icons {
            display: flex;
            gap: 1.25rem;
        }

        .add-to-post-icons div {
            cursor: pointer;
            width: 24px;
            height: 24px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: auto 100%;
        }

        .photo-video {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yC/r/a6OjkIIE-R0.png);
        }

        .tag-people {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yC/r/MqTJr_DM3Jg.png);
        }

        .feeling-activity {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yk/r/yMDS19UDsWe.png);
        }

        .check-in {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yy/r/uywzfiZad5N.png);
        }

        .gif {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yX/r/j0Jp-GpONWx.png);
        }

        .live-video {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yF/r/v1iF2605Cb5.png);
        }

        .post-btn {
            outline: none;
            border: none;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            padding: 0.75rem 0;
            margin-top: 1rem;
            font-family: 'Inter', sans-serif;
            background-color: #1b74e4;
            color: #ffffff;
            font-size: 1rem;
        }

        .post-btn:hover {
            background-color: rgba(27, 116, 228, 0.85);
        }

        .post-btn:disabled,
        .post-btn[disabled] {
            cursor: not-allowed;
            background-color: #e4e6eb;
            color: #bdc1c5;
        }

        .post-audience-section {
            transform: translateY(-5rem);
            display: none;
            border-radius: 5px;
            -webkit-box-shadow: 0 0 5px 1px grey;
            box-shadow: 0 0 5px 1px grey;
        }

        .post-audience-header {
            position: relative;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            margin: 0 auto;
            align-items: center;
            padding-left: 1.5rem;
        }

        .post-audience-header::after {
            content: "";
            position: absolute;
            width: 100%;
            height: 1px;
            bottom: -0.25rem;
            left: 0;
            background-color: rgb(193, 190, 190);
        }

        .arrow-left-icon {
            cursor: pointer;
            font-size: 1.5rem;
            color: #606770;
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yQ/r/1gFkxZXWOU8.png);
            background-position: 0px -182px;
            background-size: 26px 972px;
            width: 20px;
            height: 20px;
            background-repeat: no-repeat;
            display: inline-block;
        }

        .fa-arrow-left {
            cursor: pointer;
            background-color: #e4e6eb;
            padding: 0.5rem 0.6rem;
            border-radius: 50%;
        }

        .fa-arrow-left:hover {
            background-color: #d9dce3;
        }

        .post-audience-content {
            padding: 1rem 1rem 0 1rem;
        }

        .post-audience-content h4 {
            margin: 0.25rem 0;
        }

        .your-post-text {
            margin: 0.5rem 0 1rem 0;
        }

        .post-audience-options {
            padding: 0 0.625rem 0.625rem 0.625rem;
            overflow-y: scroll;
            height: 15rem;
        }

        .audience-option {
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.625rem;
            border-radius: 10px;
        }

        .audience-option:hover {
            background-color: hsl(210, 12%, 97%);
        }

        .audience-option-left {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .audience-option-icon {
            font-size: 1.75rem;
            width: 36px;
            height: 36px;
            transform: scale(0.65);
        }

        .earth {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yT/r/0QOZ5Rw18zW.png);
        }

        .user-group {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/ym/r/GgYVAS1o2Dp.png);
        }

        .user {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yf/r/_OLjeOMXK05.png);
        }

        .specific-user {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yg/r/xZG_j_BgiWu.png);
        }

        .lock {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yw/r/fxRwLKfcAmo.png);
        }

        .gear {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yB/r/417zloHnnzB.png);
        }

        .star {
            background-image:
                url(https://static.xx.fbcdn.net/rsrc.php/v3/yX/r/QryT_9DQQgy.png);
        }


        .audience-option-icon i {
            background-color: #e4e6eb;
            border-radius: 50%;
        }

        .fa-earth-asia {
            padding: 1rem;
        }

        .post-audience-section .fa-user-group {
            padding: 1rem 0.75rem;
        }

        .fa-user {
            padding: 1rem 1.1rem;
        }

        .fa-lock {
            padding: 1rem 1.1rem;
        }

        .fa-gear {
            padding: 1rem;
        }

        .fa-star {
            padding: 1rem 0.9rem;
        }

        .audience-option-text {
            font-weight: bold;
            margin-bottom: 0.15rem;
        }

        .audience-option-radio {
            transform: scale(1.5);
        }

        .audience-option.active {
            background-color: hsl(210, 12%, 94%);
        }
    </style>
    <title>Community Post</title>
</head>

<body>
    <main class="post">
        <div class="wrapper">
            <section class="create-post">
                <header class="header">
                    <h1>Create post</h1>
                    <div class="cross-icon">
                        <div class="cross-icon-mark"></div>
                    </div>
                </header>
                <div class="post-header">
                    <div class="profile-pic"></div>
                    <div class="user-info">
                        <div class="full-name">GeeksforGeeks</div>
                        <div class="post-audience">
                            
                        </div>
                    </div>
                </div>
                <div class="post-content">
                    <textarea name="post-desc" id="post-desc" cols="30" rows="5"
                        placeholder="What's on your mind ??"></textarea>
                    <div class="emoji-picker">
                        <emoji-picker class="light"></emoji-picker>
                        <i class="emoji" aria-label="Insert an emoji" role="img"></i>
                    </div>
                    <div class="add-to-your-post">
                        <span class="add-to-post-text">Add to your post</span>
                        <div class="add-to-post-icons">
                            <div class="photo-video"></div>
                           
                        </div>
                    </div>
                    <button class="post-btn" disabled>Post</button>
                </div>
            </section>
            <section class="post-audience-section">
                <header class="post-audience-header">
                    <div class="arrow-left-icon"></div>
                    <h1>Post Audience</h1>
                </header>
                <div class="post-audience-content">
                    <h4>Who can see your post?</h4>
                    <p class="your-post-text">Your post will show up
                        in Feed, on your profile and in search results.</p>
                    <p> Your default audience is set to Only me,
                        but you can change the<br /> audience
                        of this specific
                        post.</p>
                </div>
                <div class="post-audience-options">
                    <div class="audience-option">
                        <div class="audience-option-left">
                            <div class="audience-option-icon earth"></div>
                            <div class="audience-option-details">
                                <div class="audience-option-text">Public</div>
                                <span class="audience-option-desc">Anyone on
                                    or off Facebook</span>
                            </div>
                        </div>
                        <div class="audience-option-right">
                            <div class="radio-btn">
                                <input type="radio" name="audience-option-radio" class="audience-option-radio">
                            </div>
                        </div>
                    </div>
                    <div class="audience-option">
                        <div class="audience-option-left">
                            <div class="audience-option-icon user-group"></div>
                            <div class="audience-option-details">
                                <div class="audience-option-text">Friends</div>
                                <span class="audience-option-desc">Your friends
                                    on Facebook</span>
                            </div>
                        </div>
                        <div class="audience-option-right">
                            <div class="radio-btn">
                                <input type="radio" name="audience-option-radio" class="audience-option-radio">
                            </div>
                        </div>
                    </div>
                    <div class="audience-option">
                        <div class="audience-option-left">
                            <div class="audience-option-icon user"></div>
                            <div class="audience-option-details">
                                <div class="audience-option-text">Friends except...</div>
                                <span class="audience-option-desc">Don't show
                                    to some friends</span>
                            </div>
                        </div>
                        <div class="audience-option-right">
                            <div class="radio-btn">
                                <input type="radio" name="audience-option-radio" class="audience-option-radio">
                            </div>
                        </div>
                    </div>
                    <div class="audience-option">
                        <div class="audience-option-left">
                            <div class="audience-option-icon specific-user"></div>
                            <div class="audience-option-details">
                                <div class="audience-option-text">
                                    Specific friends</div>
                                <span class="audience-option-desc">Only
                                    show to some friends</span>
                            </div>
                        </div>
                        <div class="audience-option-right">
                            <div class="radio-btn">
                                <input type="radio" name="audience-option-radio" class="audience-option-radio">
                            </div>
                        </div>
                    </div>
                    <div class="audience-option">
                        <div class="audience-option-left">
                            <div class="audience-option-icon lock"></div>
                            <div class="audience-option-details">
                                <div class="audience-option-text">Only me</div>
                            </div>
                        </div>
                        <div class="audience-option-right">
                            <div class="radio-btn">
                                <input type="radio" name="audience-option-radio" class="audience-option-radio">
                            </div>
                        </div>
                    </div>
                    <div class="audience-option">
                        <div class="audience-option-left">
                            <div class="audience-option-icon gear"></div>
                            <div class="audience-option-details">
                                <div class="audience-option-text">Custom</div>
                                <span class="audience-option-desc">Include
                                    and exclude friends and lists</span>
                            </div>
                        </div>
                        <div class="audience-option-right">
                            <div class="radio-btn">
                                <input type="radio" name="audience-option-radio" class="audience-option-radio">
                            </div>
                        </div>
                    </div>
                    <div class="audience-option">
                        <div class="audience-option-left">
                            <div class="audience-option-icon star"></div>
                            <div class="audience-option-details">
                                <div class="audience-option-text">Close
                                    friends</div>
                                <span class="audience-option-desc">Your
                                    custom list</span>
                            </div>
                        </div>
                        <div class="audience-option-right">
                            <div class="radio-btn">
                                <input type="radio" name="audience-option-radio" class="audience-option-radio">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>
    <script src="./script.js"></script>
</body>

</html>