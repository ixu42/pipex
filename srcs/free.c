/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   free.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ixu <ixu@student.hive.fi>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/19 14:53:29 by ixu               #+#    #+#             */
/*   Updated: 2024/04/02 11:06:59 by ixu              ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../pipex.h"

void	free_arr(char **arr)
{
	int	i;

	if (arr == NULL)
		return ;
	i = 0;
	while (arr[i] != NULL)
	{
		free(arr[i]);
		i++;
	}
	free(arr);
	arr = NULL;
}

void	free_struct(t_data *data)
{
	free_arr(data->env_paths);
	free_arr(data->cmd_arr);
	free(data->cmd_path);
	data->cmd_path = NULL;
	free(data);
	data = NULL;
}
