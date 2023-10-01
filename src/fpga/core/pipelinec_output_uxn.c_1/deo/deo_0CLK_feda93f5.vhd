-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 92
entity deo_0CLK_feda93f5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_feda93f5;
architecture arch of deo_0CLK_feda93f5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l483_c6_867c]
signal BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l483_c1_d161]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l483_c2_e398]
signal device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l483_c2_e398]
signal t8_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l483_c2_e398]
signal n8_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l483_c2_e398]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l484_c3_26ae[uxn_opcodes_h_l484_c3_26ae]
signal printf_uxn_opcodes_h_l484_c3_26ae_uxn_opcodes_h_l484_c3_26ae_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l491_c11_4070]
signal BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c7_9a83]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal t8_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal n8_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l491_c7_4e9a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l495_c11_210d]
signal BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_77e5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l495_c7_9a83]
signal device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l495_c7_9a83]
signal t8_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l495_c7_9a83]
signal n8_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c7_9a83]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l495_c7_9a83]
signal result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l495_c7_9a83]
signal result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l495_c7_9a83]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l495_c7_9a83]
signal result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l495_c7_9a83]
signal result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l495_c7_9a83]
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l495_c7_9a83]
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c7_9a83]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l495_c7_9a83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c7_9a83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c7_9a83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l500_c11_c7ec]
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l500_c7_77e5]
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l500_c7_77e5]
signal n8_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_77e5]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l500_c7_77e5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l500_c7_77e5]
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c7_77e5]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l500_c7_77e5]
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l500_c7_77e5]
signal result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_77e5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_77e5]
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_77e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_77e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_77e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_77e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l504_c11_9fbc]
signal BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c1_cfcf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal n8_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l504_c7_ea9d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : signed(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l508_c32_abea]
signal BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l508_c32_0706]
signal BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l508_c32_f644]
signal MUX_uxn_opcodes_h_l508_c32_f644_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l508_c32_f644_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l508_c32_f644_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l508_c32_f644_return_output : signed(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l512_c42_d231]
signal BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l512_c23_31d0]
signal device_out_uxn_opcodes_h_l512_c23_31d0_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_31d0_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_31d0_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_31d0_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_31d0_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l512_c23_31d0_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5f30( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : signed;
 ref_toks_13 : unsigned;
 ref_toks_14 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.is_device_ram_read := ref_toks_5;
      base.device_ram_value := ref_toks_6;
      base.vram_value := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.device_ram_address := ref_toks_9;
      base.is_opc_done := ref_toks_10;
      base.is_sp_shift := ref_toks_11;
      base.sp_relative_shift := ref_toks_12;
      base.stack_address_sp_offset := ref_toks_13;
      base.is_stack_index_flipped := ref_toks_14;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c
BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_left,
BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_right,
BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l483_c2_e398
device_out_result_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_cond,
device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- t8_MUX_uxn_opcodes_h_l483_c2_e398
t8_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l483_c2_e398_cond,
t8_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
t8_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
t8_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- n8_MUX_uxn_opcodes_h_l483_c2_e398
n8_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l483_c2_e398_cond,
n8_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
n8_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
n8_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398
result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398
result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

-- printf_uxn_opcodes_h_l484_c3_26ae_uxn_opcodes_h_l484_c3_26ae
printf_uxn_opcodes_h_l484_c3_26ae_uxn_opcodes_h_l484_c3_26ae : entity work.printf_uxn_opcodes_h_l484_c3_26ae_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l484_c3_26ae_uxn_opcodes_h_l484_c3_26ae_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070
BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_left,
BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_right,
BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a
device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- t8_MUX_uxn_opcodes_h_l491_c7_4e9a
t8_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
t8_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
t8_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
t8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- n8_MUX_uxn_opcodes_h_l491_c7_4e9a
n8_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
n8_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
n8_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
n8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a
result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a
result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d
BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_left,
BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_right,
BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83
device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- t8_MUX_uxn_opcodes_h_l495_c7_9a83
t8_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
t8_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
t8_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
t8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- n8_MUX_uxn_opcodes_h_l495_c7_9a83
n8_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
n8_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
n8_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
n8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83
result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83
result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec
BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_left,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_right,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5
device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- n8_MUX_uxn_opcodes_h_l500_c7_77e5
n8_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
n8_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
n8_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
n8_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5
result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5
result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc
BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_left,
BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_right,
BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d
device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- n8_MUX_uxn_opcodes_h_l504_c7_ea9d
n8_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
n8_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
n8_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
n8_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d
result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d
result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l508_c32_abea
BIN_OP_AND_uxn_opcodes_h_l508_c32_abea : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_left,
BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_right,
BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l508_c32_0706
BIN_OP_GT_uxn_opcodes_h_l508_c32_0706 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_left,
BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_right,
BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_return_output);

-- MUX_uxn_opcodes_h_l508_c32_f644
MUX_uxn_opcodes_h_l508_c32_f644 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l508_c32_f644_cond,
MUX_uxn_opcodes_h_l508_c32_f644_iftrue,
MUX_uxn_opcodes_h_l508_c32_f644_iffalse,
MUX_uxn_opcodes_h_l508_c32_f644_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231
BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_left,
BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_right,
BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_return_output);

-- device_out_uxn_opcodes_h_l512_c23_31d0
device_out_uxn_opcodes_h_l512_c23_31d0 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l512_c23_31d0_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l512_c23_31d0_device_address,
device_out_uxn_opcodes_h_l512_c23_31d0_value,
device_out_uxn_opcodes_h_l512_c23_31d0_phase,
device_out_uxn_opcodes_h_l512_c23_31d0_previous_device_ram_read,
device_out_uxn_opcodes_h_l512_c23_31d0_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 t8_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 n8_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 t8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 n8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 t8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 n8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 n8_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_return_output,
 device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 n8_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_return_output,
 BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_return_output,
 MUX_uxn_opcodes_h_l508_c32_f644_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_return_output,
 device_out_uxn_opcodes_h_l512_c23_31d0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l487_c3_08d1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l484_c3_26ae_uxn_opcodes_h_l484_c3_26ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l493_c3_4b88 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l498_c3_0dc1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c3_156c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_77e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l504_c7_ea9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l508_c32_f644_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l508_c32_f644_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l508_c32_f644_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l508_c32_f644_return_output : signed(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_31d0_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_31d0_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_31d0_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_31d0_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_31d0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l512_c23_31d0_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_c32_9273_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l514_c31_90ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_03b1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l516_c29_5526_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l517_c26_f981_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l518_c25_178b_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l519_c23_0663_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l520_c24_b896_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1b85_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_27a6_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_584f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1342_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cb30_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_4b93_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_26df_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l495_l483_l500_l491_DUPLICATE_4aed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_f3ac_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l495_l504_l500_l491_DUPLICATE_6ee3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5f30_uxn_opcodes_h_l523_l478_DUPLICATE_129b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l508_c32_f644_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c3_156c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c3_156c;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l487_c3_08d1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l487_c3_08d1;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l498_c3_0dc1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l498_c3_0dc1;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l493_c3_4b88 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l493_c3_4b88;
     VAR_MUX_uxn_opcodes_h_l508_c32_f644_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l512_c23_31d0_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l512_c23_31d0_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l512_c23_31d0_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_26df LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_26df_return_output := result.device_ram_address;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l483_c2_e398_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l500_c11_c7ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l495_c11_210d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_left;
     BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output := BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_4b93 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_4b93_return_output := result.is_vram_write;

     -- BIN_OP_AND[uxn_opcodes_h_l508_c32_abea] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_left;
     BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_return_output := BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_584f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_584f_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_27a6 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_27a6_return_output := result.vram_address;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_77e5_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l495_l504_l500_l491_DUPLICATE_6ee3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l495_l504_l500_l491_DUPLICATE_6ee3_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cb30 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cb30_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l483_c6_867c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_left;
     BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output := BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l512_c42_d231] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_left;
     BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_return_output := BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l504_c7_ea9d_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l504_c11_9fbc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_left;
     BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output := BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1b85 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1b85_return_output := result.is_device_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l483_c2_e398_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1342 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1342_return_output := result.device_ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l495_l483_l500_l491_DUPLICATE_4aed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l495_l483_l500_l491_DUPLICATE_4aed_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_f3ac LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_f3ac_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l491_c11_4070] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_left;
     BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output := BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_left := VAR_BIN_OP_AND_uxn_opcodes_h_l508_c32_abea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l483_c2_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l483_c6_867c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_4e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l491_c11_4070_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l495_c7_9a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c11_210d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_c7ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l504_c11_9fbc_return_output;
     VAR_device_out_uxn_opcodes_h_l512_c23_31d0_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l512_c42_d231_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_f3ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_f3ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_f3ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_f3ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_f3ac_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_584f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_584f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_584f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_584f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_584f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1b85_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1b85_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1b85_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1b85_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1b85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l495_l504_l500_l491_DUPLICATE_6ee3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l495_l504_l500_l491_DUPLICATE_6ee3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l495_l504_l500_l491_DUPLICATE_6ee3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l495_l504_l500_l491_DUPLICATE_6ee3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l495_l483_l500_l491_DUPLICATE_4aed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l495_l483_l500_l491_DUPLICATE_4aed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l495_l483_l500_l491_DUPLICATE_4aed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l495_l483_l500_l491_DUPLICATE_4aed_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_4b93_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_4b93_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_4b93_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_4b93_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_4b93_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cb30_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cb30_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cb30_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cb30_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_cb30_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_27a6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_27a6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_27a6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_27a6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_27a6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_26df_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_26df_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_26df_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_26df_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_26df_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1342_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1342_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1342_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1342_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l500_l504_l495_l491_l483_DUPLICATE_1342_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l483_c2_e398_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l483_c2_e398_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_77e5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l483_c1_d161] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- t8_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_t8_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     t8_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     t8_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := t8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- n8_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_n8_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     n8_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     n8_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := n8_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l508_c32_0706] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_left;
     BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_return_output := BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l508_c32_f644_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l508_c32_0706_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     VAR_printf_uxn_opcodes_h_l484_c3_26ae_uxn_opcodes_h_l484_c3_26ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l483_c1_d161_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- n8_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     n8_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     n8_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := n8_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- t8_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_t8_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     t8_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     t8_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := t8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- printf_uxn_opcodes_h_l484_c3_26ae[uxn_opcodes_h_l484_c3_26ae] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l484_c3_26ae_uxn_opcodes_h_l484_c3_26ae_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l484_c3_26ae_uxn_opcodes_h_l484_c3_26ae_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l508_c32_f644] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l508_c32_f644_cond <= VAR_MUX_uxn_opcodes_h_l508_c32_f644_cond;
     MUX_uxn_opcodes_h_l508_c32_f644_iftrue <= VAR_MUX_uxn_opcodes_h_l508_c32_f644_iftrue;
     MUX_uxn_opcodes_h_l508_c32_f644_iffalse <= VAR_MUX_uxn_opcodes_h_l508_c32_f644_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l508_c32_f644_return_output := MUX_uxn_opcodes_h_l508_c32_f644_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue := VAR_MUX_uxn_opcodes_h_l508_c32_f644_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_n8_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_t8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- t8_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_t8_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     t8_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     t8_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l483_c2_e398_return_output := t8_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- n8_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_n8_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     n8_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     n8_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := n8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l483_c2_e398_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- n8_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_n8_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     n8_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     n8_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := n8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_n8_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c1_cfcf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- n8_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_n8_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     n8_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     n8_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l483_c2_e398_return_output := n8_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l512_c23_31d0_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c1_cfcf_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l483_c2_e398_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     -- device_out[uxn_opcodes_h_l512_c23_31d0] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l512_c23_31d0_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l512_c23_31d0_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l512_c23_31d0_device_address <= VAR_device_out_uxn_opcodes_h_l512_c23_31d0_device_address;
     device_out_uxn_opcodes_h_l512_c23_31d0_value <= VAR_device_out_uxn_opcodes_h_l512_c23_31d0_value;
     device_out_uxn_opcodes_h_l512_c23_31d0_phase <= VAR_device_out_uxn_opcodes_h_l512_c23_31d0_phase;
     device_out_uxn_opcodes_h_l512_c23_31d0_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l512_c23_31d0_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l512_c23_31d0_return_output := device_out_uxn_opcodes_h_l512_c23_31d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := VAR_device_out_uxn_opcodes_h_l512_c23_31d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l519_c23_0663] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l519_c23_0663_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_31d0_return_output.vram_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l516_c29_5526] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l516_c29_5526_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_31d0_return_output.device_ram_value;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l514_c31_90ce] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l514_c31_90ce_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_31d0_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l517_c26_f981] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l517_c26_f981_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_31d0_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l515_c31_03b1] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_03b1_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_31d0_return_output.device_ram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l518_c25_178b] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l518_c25_178b_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_31d0_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l520_c24_b896] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l520_c24_b896_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_31d0_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l513_c32_9273] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_c32_9273_return_output := VAR_device_out_uxn_opcodes_h_l512_c23_31d0_return_output.is_device_ram_write;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l520_c24_b896_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l514_c31_90ce_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_c32_9273_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l517_c26_f981_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l519_c23_0663_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l518_c25_178b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_03b1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l516_c29_5526_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l504_c7_ea9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l504_c7_ea9d_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_77e5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l500_c7_77e5_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c7_9a83] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l495_c7_9a83_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l491_c7_4e9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_return_output := device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l483_c2_e398_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l491_c7_4e9a_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l483_c2_e398] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_cond;
     result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output := result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5f30_uxn_opcodes_h_l523_l478_DUPLICATE_129b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5f30_uxn_opcodes_h_l523_l478_DUPLICATE_129b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5f30(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l483_c2_e398_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l483_c2_e398_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5f30_uxn_opcodes_h_l523_l478_DUPLICATE_129b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5f30_uxn_opcodes_h_l523_l478_DUPLICATE_129b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
