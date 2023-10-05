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
-- Submodules: 90
entity deo_0CLK_52d54777 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_52d54777;
architecture arch of deo_0CLK_52d54777 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l455_c6_8452]
signal BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l455_c1_0fbe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l461_c7_6a74]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l455_c2_2e78]
signal device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l455_c2_2e78]
signal n8_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l455_c2_2e78]
signal t8_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l455_c2_2e78]
signal result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l455_c2_2e78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l455_c2_2e78]
signal result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(1 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l455_c2_2e78]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l455_c2_2e78]
signal result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l455_c2_2e78]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l455_c2_2e78]
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l455_c2_2e78]
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l455_c2_2e78]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l455_c2_2e78]
signal result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l455_c2_2e78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l455_c2_2e78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l456_c3_de9e[uxn_opcodes_h_l456_c3_de9e]
signal printf_uxn_opcodes_h_l456_c3_de9e_uxn_opcodes_h_l456_c3_de9e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l461_c11_f633]
signal BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l464_c7_68d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l461_c7_6a74]
signal device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l461_c7_6a74]
signal n8_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l461_c7_6a74]
signal t8_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l461_c7_6a74]
signal result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l461_c7_6a74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l461_c7_6a74]
signal result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(1 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l461_c7_6a74]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l461_c7_6a74]
signal result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l461_c7_6a74]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l461_c7_6a74]
signal result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l461_c7_6a74]
signal result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l461_c7_6a74]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l461_c7_6a74]
signal result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l461_c7_6a74]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l461_c7_6a74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l464_c11_4d3d]
signal BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l468_c7_f461]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l464_c7_68d0]
signal device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l464_c7_68d0]
signal n8_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l464_c7_68d0]
signal t8_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l464_c7_68d0]
signal result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l464_c7_68d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l464_c7_68d0]
signal result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(1 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l464_c7_68d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l464_c7_68d0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l464_c7_68d0]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l464_c7_68d0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l464_c7_68d0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l464_c7_68d0]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l464_c7_68d0]
signal result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l464_c7_68d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l464_c7_68d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l468_c11_ee65]
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l471_c7_cb00]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l468_c7_f461]
signal device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l468_c7_f461]
signal n8_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l468_c7_f461]
signal result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l468_c7_f461]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l468_c7_f461]
signal result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(1 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l468_c7_f461]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l468_c7_f461]
signal result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l468_c7_f461]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l468_c7_f461]
signal result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l468_c7_f461]
signal result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l468_c7_f461]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l468_c7_f461]
signal result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l468_c7_f461]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l468_c7_f461]
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l471_c11_ba30]
signal BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c1_4a3e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l471_c7_cb00]
signal device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l471_c7_cb00]
signal n8_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l471_c7_cb00]
signal result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l471_c7_cb00]
signal result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(1 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l471_c7_cb00]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l471_c7_cb00]
signal result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l471_c7_cb00]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l471_c7_cb00]
signal result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l471_c7_cb00]
signal result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l471_c7_cb00]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l471_c7_cb00]
signal result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(31 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l471_c7_cb00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l471_c7_cb00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l475_c32_78e7]
signal BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l475_c32_cfbb]
signal BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l475_c32_efb5]
signal MUX_uxn_opcodes_h_l475_c32_efb5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l475_c32_efb5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l475_c32_efb5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l475_c32_efb5_return_output : signed(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l479_c42_3de2]
signal BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l479_c23_c10c]
signal device_out_uxn_opcodes_h_l479_c23_c10c_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l479_c23_c10c_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l479_c23_c10c_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l479_c23_c10c_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l479_c23_c10c_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l479_c23_c10c_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cbca( ref_toks_0 : opcode_result_t;
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
 ref_toks_11 : signed;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.device_ram_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.vram_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.device_ram_address := ref_toks_8;
      base.is_device_ram_read := ref_toks_9;
      base.vram_address := ref_toks_10;
      base.sp_relative_shift := ref_toks_11;
      base.is_opc_done := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452
BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_left,
BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_right,
BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78
device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- n8_MUX_uxn_opcodes_h_l455_c2_2e78
n8_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
n8_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
n8_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
n8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- t8_MUX_uxn_opcodes_h_l455_c2_2e78
t8_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
t8_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
t8_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
t8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78
result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78
result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78
result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78
result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78
result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78
result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

-- printf_uxn_opcodes_h_l456_c3_de9e_uxn_opcodes_h_l456_c3_de9e
printf_uxn_opcodes_h_l456_c3_de9e_uxn_opcodes_h_l456_c3_de9e : entity work.printf_uxn_opcodes_h_l456_c3_de9e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l456_c3_de9e_uxn_opcodes_h_l456_c3_de9e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633
BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_left,
BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_right,
BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74
device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- n8_MUX_uxn_opcodes_h_l461_c7_6a74
n8_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
n8_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
n8_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
n8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- t8_MUX_uxn_opcodes_h_l461_c7_6a74
t8_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
t8_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
t8_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
t8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74
result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74
result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74
result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74
result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74
result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74
result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74
result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74
result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74
result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74
result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d
BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_left,
BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_right,
BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0
device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- n8_MUX_uxn_opcodes_h_l464_c7_68d0
n8_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
n8_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
n8_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
n8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- t8_MUX_uxn_opcodes_h_l464_c7_68d0
t8_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
t8_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
t8_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
t8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0
result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0
result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0
result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0
result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0
result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65
BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_left,
BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_right,
BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l468_c7_f461
device_out_result_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_cond,
device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- n8_MUX_uxn_opcodes_h_l468_c7_f461
n8_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l468_c7_f461_cond,
n8_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
n8_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
n8_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461
result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461
result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_cond,
result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461
result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461
result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461
result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461
result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461
result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461
result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461
result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_cond,
result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461
result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30
BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_left,
BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_right,
BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00
device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- n8_MUX_uxn_opcodes_h_l471_c7_cb00
n8_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
n8_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
n8_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
n8_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00
result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00
result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00
result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00
result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00
result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00
result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00
result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00
result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00
result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00
result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00
result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7
BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_left,
BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_right,
BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb
BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_left,
BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_right,
BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_return_output);

-- MUX_uxn_opcodes_h_l475_c32_efb5
MUX_uxn_opcodes_h_l475_c32_efb5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l475_c32_efb5_cond,
MUX_uxn_opcodes_h_l475_c32_efb5_iftrue,
MUX_uxn_opcodes_h_l475_c32_efb5_iffalse,
MUX_uxn_opcodes_h_l475_c32_efb5_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2
BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_left,
BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_right,
BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_return_output);

-- device_out_uxn_opcodes_h_l479_c23_c10c
device_out_uxn_opcodes_h_l479_c23_c10c : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l479_c23_c10c_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l479_c23_c10c_device_address,
device_out_uxn_opcodes_h_l479_c23_c10c_value,
device_out_uxn_opcodes_h_l479_c23_c10c_phase,
device_out_uxn_opcodes_h_l479_c23_c10c_previous_device_ram_read,
device_out_uxn_opcodes_h_l479_c23_c10c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 n8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 t8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 n8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 t8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 n8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 t8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 n8_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 n8_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_return_output,
 BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_return_output,
 BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_return_output,
 MUX_uxn_opcodes_h_l475_c32_efb5_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_return_output,
 device_out_uxn_opcodes_h_l479_c23_c10c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l458_c3_b38b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l456_c3_de9e_uxn_opcodes_h_l456_c3_de9e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_a837 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l466_c3_93f6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c3_c0f5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_f461_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c32_efb5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c32_efb5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c32_efb5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c32_efb5_return_output : signed(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l479_c23_c10c_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l479_c23_c10c_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l479_c23_c10c_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l479_c23_c10c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l479_c23_c10c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l479_c23_c10c_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l480_c32_d556_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l481_c31_6165_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l482_c31_6470_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l483_c29_157f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l484_c26_b37c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l485_c25_b061_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l486_c23_38db_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l487_c24_e668_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_bf28_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_7750_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l455_l468_DUPLICATE_d5cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_dd43_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_d600_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_43a4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_9ca8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_4780_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_617a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_bf3b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_6d2a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbca_uxn_opcodes_h_l490_l450_DUPLICATE_31c6_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l466_c3_93f6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l466_c3_93f6;
     VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_a837 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_a837;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c3_c0f5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c3_c0f5;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_right := to_unsigned(2, 2);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l475_c32_efb5_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l458_c3_b38b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l458_c3_b38b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l475_c32_efb5_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l479_c23_c10c_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l479_c23_c10c_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l479_c23_c10c_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := t8;
     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_7750 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_7750_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_d600 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_d600_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_9ca8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_9ca8_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l464_c11_4d3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l468_c11_ee65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_left;
     BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output := BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l475_c32_78e7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_left;
     BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_return_output := BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l461_c11_f633] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_left;
     BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output := BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l455_c6_8452] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_left;
     BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output := BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_6d2a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_6d2a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l471_c11_ba30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_left;
     BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output := BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_43a4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_43a4_return_output := result.device_ram_address;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_f461_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_617a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_617a_return_output := result.sp_relative_shift;

     -- BIN_OP_MINUS[uxn_opcodes_h_l479_c42_3de2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_left;
     BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_return_output := BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l455_l468_DUPLICATE_d5cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l455_l468_DUPLICATE_d5cf_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_dd43 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_dd43_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_bf3b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_bf3b_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_bf28 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_bf28_return_output := result.device_ram_value;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_4780 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_4780_return_output := result.vram_address;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_78e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_2e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_8452_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l461_c7_6a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_f633_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l464_c7_68d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_4d3d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_ee65_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_ba30_return_output;
     VAR_device_out_uxn_opcodes_h_l479_c23_c10c_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_3de2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_617a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_617a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_617a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_617a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_617a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_9ca8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_9ca8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_9ca8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_9ca8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_9ca8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_dd43_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_dd43_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_dd43_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_dd43_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_dd43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_6d2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_6d2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_6d2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_6d2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l455_l468_DUPLICATE_d5cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l455_l468_DUPLICATE_d5cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l455_l468_DUPLICATE_d5cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l455_l468_DUPLICATE_d5cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_bf3b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_bf3b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_bf3b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l461_l471_l464_l468_DUPLICATE_bf3b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_d600_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_d600_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_d600_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_d600_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_d600_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_7750_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_7750_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_7750_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_7750_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_7750_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_4780_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_4780_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_4780_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_4780_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_4780_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_43a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_43a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_43a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_43a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_43a4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_bf28_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_bf28_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_bf28_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_bf28_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l464_l461_l471_l455_l468_DUPLICATE_bf28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_f461_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l455_c1_0fbe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l475_c32_cfbb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_left;
     BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_return_output := BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- n8_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_n8_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     n8_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     n8_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := n8_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- t8_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_t8_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     t8_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     t8_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := t8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l475_c32_efb5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_cfbb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     VAR_printf_uxn_opcodes_h_l456_c3_de9e_uxn_opcodes_h_l456_c3_de9e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_0fbe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_n8_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_t8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     -- printf_uxn_opcodes_h_l456_c3_de9e[uxn_opcodes_h_l456_c3_de9e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l456_c3_de9e_uxn_opcodes_h_l456_c3_de9e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l456_c3_de9e_uxn_opcodes_h_l456_c3_de9e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_t8_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     t8_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     t8_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := t8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- MUX[uxn_opcodes_h_l475_c32_efb5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l475_c32_efb5_cond <= VAR_MUX_uxn_opcodes_h_l475_c32_efb5_cond;
     MUX_uxn_opcodes_h_l475_c32_efb5_iftrue <= VAR_MUX_uxn_opcodes_h_l475_c32_efb5_iftrue;
     MUX_uxn_opcodes_h_l475_c32_efb5_iffalse <= VAR_MUX_uxn_opcodes_h_l475_c32_efb5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l475_c32_efb5_return_output := MUX_uxn_opcodes_h_l475_c32_efb5_return_output;

     -- n8_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_n8_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     n8_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     n8_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l468_c7_f461_return_output := n8_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue := VAR_MUX_uxn_opcodes_h_l475_c32_efb5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_t8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- t8_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_t8_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     t8_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     t8_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := t8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- n8_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_n8_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     n8_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     n8_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := n8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_n8_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- n8_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_n8_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     n8_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     n8_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := n8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_n8_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c1_4a3e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- n8_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_n8_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     n8_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     n8_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := n8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l479_c23_c10c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_4a3e_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     -- device_out[uxn_opcodes_h_l479_c23_c10c] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l479_c23_c10c_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l479_c23_c10c_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l479_c23_c10c_device_address <= VAR_device_out_uxn_opcodes_h_l479_c23_c10c_device_address;
     device_out_uxn_opcodes_h_l479_c23_c10c_value <= VAR_device_out_uxn_opcodes_h_l479_c23_c10c_value;
     device_out_uxn_opcodes_h_l479_c23_c10c_phase <= VAR_device_out_uxn_opcodes_h_l479_c23_c10c_phase;
     device_out_uxn_opcodes_h_l479_c23_c10c_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l479_c23_c10c_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l479_c23_c10c_return_output := device_out_uxn_opcodes_h_l479_c23_c10c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := VAR_device_out_uxn_opcodes_h_l479_c23_c10c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l481_c31_6165] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l481_c31_6165_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_c10c_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l487_c24_e668] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l487_c24_e668_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_c10c_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l480_c32_d556] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l480_c32_d556_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_c10c_return_output.is_device_ram_write;

     -- device_out_result_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l485_c25_b061] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l485_c25_b061_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_c10c_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l484_c26_b37c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l484_c26_b37c_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_c10c_return_output.is_vram_write;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l483_c29_157f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l483_c29_157f_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_c10c_return_output.device_ram_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l482_c31_6470] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l482_c31_6470_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_c10c_return_output.device_ram_address;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l486_c23_38db] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l486_c23_38db_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_c10c_return_output.vram_value;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l487_c24_e668_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l481_c31_6165_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l480_c32_d556_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l484_c26_b37c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l486_c23_38db_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l485_c25_b061_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l482_c31_6470_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l483_c29_157f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_return_output := device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l471_c7_cb00] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_cond;
     result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output := result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_cb00_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output := result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output := result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l468_c7_f461] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_f461_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l464_c7_68d0] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_68d0_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l461_c7_6a74] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_6a74_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l455_c2_2e78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cbca_uxn_opcodes_h_l490_l450_DUPLICATE_31c6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbca_uxn_opcodes_h_l490_l450_DUPLICATE_31c6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cbca(
     result,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_2e78_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_2e78_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbca_uxn_opcodes_h_l490_l450_DUPLICATE_31c6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbca_uxn_opcodes_h_l490_l450_DUPLICATE_31c6_return_output;
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
