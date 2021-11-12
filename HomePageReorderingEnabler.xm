/* Home Page Reordering Enabler - Enable Home Page Reordering
 * Copyright (C) 2021 Tomasz Poliszuk
 *
 * Home Page Reordering Enabler is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * Home Page Reordering Enabler is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Home Page Reordering Enabler. If not, see <https://www.gnu.org/licenses/>.
 */


@interface SBIconView : UIView
@property (nonatomic, copy) NSString *location;
@end

%hook SBIconView
- (bool)canBeginDrags {
	bool origValue = %orig;
	if ( [ [self location] isEqual:@"SBRootFolderViewPageManagement" ] ) {
		return YES;
	}
	return origValue;
}
- (bool)startsDragMoreQuickly {
	bool origValue = %orig;
	if ( [ [self location] isEqual:@"SBRootFolderViewPageManagement" ] ) {
		return YES;
	}
	return origValue;
}
%end

%hook SBRootFolderViewPageManagementLayoutManager
- (bool)iconViewCanBeginDrags:(id)arg1 {
	return YES;
}
%end

%hook SBPageManagementCellViewController
- (bool)isUserInteractionEnabled {
	return YES;
}
%end
