import 'package:flutter/material.dart';

import '../../../common/data/models/chat.dart';
import '../../../common/utils/insets.dart';
import '../../../common/utils/radius.dart';
import '../../../common/utils/text_styles.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.chat,
    required this.onTap,
    required this.onLongPress,
    this.isSelected = false,
  });

  final Chat chat;
  final void Function() onTap;
  final void Function() onLongPress;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Insets.small,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: isSelected ? Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ) : null,
              borderRadius: BorderRadius.circular(Radius.large),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(Radius.large),
              onTap: onTap,
              onLongPress: onLongPress,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Insets.large,
                  vertical: Insets.medium,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: Insets.large,
                      ),
                      child: Icon(chat.icon),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                chat.name,
                                style: TextStyles.defaultMedium(context),
                              ),
                              Text(
                                chat.lastMessage != null
                                    ? chat.lastMessage!.time
                                    : '',
                                style: TextStyles.defaultGrey(context),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  chat.lastMessage != null
                                      ? chat.lastMessage!.text
                                      : 'Write your first message!',
                                  textAlign: TextAlign.start,
                                  style: TextStyles.defaultGrey(context),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 1,
                                ),
                              ),
                              if (chat.isPinned)
                                const Icon(
                                  Icons.push_pin_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
